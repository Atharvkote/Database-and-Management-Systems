
# Understanding Cursors in MySQL Stored Procedures

## What is a Cursor?

A **cursor** is a database object used to retrieve and manipulate data **row-by-row** from a result set. While SQL is set-based (works with whole sets of data), sometimes you need to process one row at a time — this is where cursors come in handy.

Think of a cursor as a pointer that moves through the rows of a query result, allowing you to work with each row individually.

## Why Use Cursors?

* **Row-by-row processing:** When you cannot perform an operation on all rows at once and need to handle them one at a time (for example, complex calculations, conditional logic per row).
* **Iteration:** To loop through query results in stored procedures and execute custom logic on each record.
* **Flexibility:** Allows combining SQL and procedural code inside loops.

## Cursor Lifecycle in Stored Procedures

The typical steps involved with cursors are:

1. **Declare the cursor:** Define the SELECT statement whose rows you want to process.
2. **Declare handlers:** Manage conditions like "no more rows" when fetching data.
3. **Open the cursor:** Initialize it and prepare to fetch rows.
4. **Fetch rows:** Retrieve one row at a time into variables.
5. **Process data:** Use or manipulate the fetched data inside a loop.
6. **Close the cursor:** Release resources after processing is done.

## Basic Syntax for Using a Cursor

```sql
DECLARE cursor_name CURSOR FOR
    SELECT_statement;

DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET done = 1;

OPEN cursor_name;

read_loop: LOOP
    FETCH cursor_name INTO var1, var2, ...;
    IF done = 1 THEN
        LEAVE read_loop;
    END IF;

    -- Process each row here

END LOOP read_loop;

CLOSE cursor_name;
```

## Step-by-Step Explanation

| Step                                        | Purpose                                                       |
| ------------------------------------------- | ------------------------------------------------------------- |
| `DECLARE cursor_name CURSOR FOR SELECT...`  | Defines the cursor and the result set it will iterate over    |
| `DECLARE CONTINUE HANDLER FOR NOT FOUND`    | Sets a flag (`done = 1`) when there are no more rows to fetch |
| `OPEN cursor_name;`                         | Starts the cursor and executes the SELECT query               |
| `FETCH cursor_name INTO ...`                | Retrieves the next row from the cursor into local variables   |
| `IF done = 1 THEN LEAVE read_loop; END IF;` | Exits the loop when all rows have been processed              |
| Loop body                                   | Place where you add code to process each fetched row          |
| `CLOSE cursor_name;`                        | Frees the cursor and associated resources                     |

## Example: Cursor to Read and Display Students Data

```sql
DELIMITER //

CREATE PROCEDURE read_students()
BEGIN
    DECLARE r INT;
    DECLARE n VARCHAR(50);
    DECLARE c VARCHAR(20);
    DECLARE done INT DEFAULT 0;

    DECLARE stud_cur CURSOR FOR SELECT rollno, name, class FROM students;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN stud_cur;

    read_loop: LOOP
        FETCH stud_cur INTO r, n, c;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT CONCAT('Roll:', r, ', Name:', n, ', Class:', c) AS student_info;
    END LOOP read_loop;

    CLOSE stud_cur;
END;
//

DELIMITER ;
```

## How to Use This Procedure

1. Create and save the procedure in your MySQL database.
2. Call it using:

```sql
CALL read_students();
```

3. It will output each student's info row-by-row.

## Important Tips

* **Avoid cursors when possible:** Set-based SQL is faster and more efficient. Use cursors only when row-by-row processing is necessary.
* **Always close cursors:** To prevent resource leaks, always `CLOSE` your cursor after use.
* **Handlers are crucial:** Without the `NOT FOUND` handler, your cursor loop won't know when to stop fetching rows.
* **Use descriptive names:** Naming your cursors and handlers clearly helps readability.

## Summary

| Term             | Description                                  |
| ---------------- | -------------------------------------------- |
| Cursor           | Pointer to a query result set                |
| FETCH            | Retrieves a single row into variables        |
| CONTINUE HANDLER | Detects when no more rows are available      |
| OPEN & CLOSE     | Initialize and clean up cursor resources     |
| LOOP             | Allows processing each row inside the cursor |

## Folder Structure Suggestion

```
mysql-cursors/
├── read_students.sql   # Procedure script using cursor
├── README.md           # This guide
├── sample_data.sql     # Optional data setup
```

## What Happens When You Execute `OPEN stud_cur;` in a MySQL Stored Procedure?

### 1. **Preparing the Cursor**

When you declare a cursor like this:

```sql
DECLARE stud_cur CURSOR FOR SELECT rollno, name, class FROM students;
```

you’re essentially telling MySQL:

>[!NOTE]
 "Hey, I want to iterate over the result set produced by this SELECT query."

But at this point, **no actual query execution happens** — it's just a definition.


### 2. **Executing `OPEN stud_cur;`**

When you run:

```sql
OPEN stud_cur;
```

MySQL performs the following key actions:

* **Executes the SQL query associated with the cursor** (`SELECT rollno, name, class FROM students`).
* **Builds a result set (temporary data structure) in memory** to hold the rows returned by that query.
* **Allocates a memory buffer or cursor context** to keep track of the current position in the result set.
* **Initializes internal pointers** that let the procedure fetch rows one by one.


### 3. **Memory Allocation**

* MySQL allocates memory for the result set returned by the cursor’s SELECT statement. This memory is managed internally by the server.
* The amount of memory depends on:

  * The size of the rows returned.
  * The total number of rows.
  * Server settings that control memory allocation for cursors and temporary tables.
* In some cases, if the result set is very large, MySQL may use **disk-based temporary tables** instead of in-memory buffers to avoid excessive memory use.
* The **cursor’s context** holds:

  * The current fetch position (which row you are on).
  * Metadata about the columns (data types, sizes).
  * Buffers to hold the fetched row data temporarily.


### 4. **Why is `OPEN` Important?**

* It starts the query execution and prepares the result set **once**.
* It lets you **fetch rows sequentially** without running the query repeatedly.
* It reserves server resources for cursor operation — resources that must be explicitly released later with `CLOSE`.


### 5. **Resource Management and Cleanup**

* After you finish processing rows using `FETCH`, you must run:

```sql
CLOSE stud_cur;
```

* This tells MySQL to:

  * Free the memory and other resources allocated for the cursor.
  * Release locks or temporary tables associated with the cursor.
  * Clean up the cursor context to avoid memory leaks.

Failing to close cursors properly can cause:

* Memory consumption to grow unnecessarily.
* Potential locking or resource contention on the server.


### Summary Table: `OPEN stud_cur;`

| Step                                | What Happens                         | Importance                          |
| ----------------------------------- | ------------------------------------ | ----------------------------------- |
| Execute SELECT query internally     | Query runs, result set generated     | Prepares data for row-by-row fetch  |
| Allocate memory buffer              | Memory/disk space reserved for data  | Enables efficient sequential access |
| Initialize cursor context           | Sets up current position and buffers | Tracks progress through result set  |
| Locks/temporary storage may be used | Ensures data consistency if needed   | Maintains transactional integrity   |


## Visualization

```
+----------------------------+
|       OPEN stud_cur;       |
+----------------------------+
            |
            v
+----------------------------+
| Execute SELECT query        | <-- Reads data from `students` table
+----------------------------+
            |
            v
+----------------------------+
| Allocate memory buffer      | <-- Stores rows internally
+----------------------------+
            |
            v
+----------------------------+
| Initialize cursor context   | <-- Prepare pointers & row buffers
+----------------------------+
            |
            v
| Cursor ready to FETCH rows  |
+----------------------------+
```
