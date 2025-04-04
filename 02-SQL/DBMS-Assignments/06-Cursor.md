**Step-by-Step Documentation for MySQL Cursor Procedure**

## **Introduction**

This document provides a step-by-step guide to creating and executing a MySQL stored procedure using a cursor to copy records from one table (`student1`) to another (`student2`).



## **Step 1: Create a Database**

Before creating tables or stored procedures, we need to create a database where all operations will take place.

```sql
CREATE DATABASE Db2;
```

Switch to the newly created database:

```sql
USE Db2;
```

## **Step 2: Create Tables**

We need two tables: `student1` (source table) and `student2` (destination table). Both have the same schema.

```sql
CREATE TABLE student1 (
    roll_no INT PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE student2 (
    roll_no INT PRIMARY KEY,
    name VARCHAR(20)
);
```

### **Explanation:**

- `roll_no`: An integer that serves as the primary key.
- `name`: A string column that holds student names.
- Both tables have identical structures to facilitate data copying.


## **Step 3: Insert Sample Data into**

To test our procedure, we will insert sample records into `student1`.

```sql
INSERT INTO student1 VALUES 
(24, 'atharva'), 
(45, 'Prnava'), 
(20, 'Bhushan'), 
(10, 'Sairaj');
```

### **Explanation:**

This command inserts four students' roll numbers and names into `student1`.



## **Step 4: Verify the Data in**

Check whether the records have been inserted successfully.

```sql
SELECT * FROM student1;
```

Expected Output:

```
+---------+---------+
| roll_no | name    |
+---------+---------+
|      10 | Sairaj  |
|      20 | Bhushan |
|      24 | atharva |
|      45 | Prnava  |
+---------+---------+
```


## **Step 5: Create a Stored Procedure with Cursor**

We now create a stored procedure `copy_record4()` that copies data from `student1` to `student2`.

```sql
DELIMITER //

CREATE PROCEDURE copy_record4()
BEGIN
    -- Declare variables
    DECLARE r INT;
    DECLARE n VARCHAR(20);
    DECLARE isFinished INT DEFAULT 0;
    
    -- Declare cursor
    DECLARE c CURSOR FOR SELECT roll_no, name FROM student1;
    
    -- Declare handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET isFinished = 1;
    
    -- Open cursor
    OPEN c;
    
    -- Start loop to fetch data
    getdata: LOOP
        FETCH c INTO r, n;
        
        IF isFinished = 1 THEN
            LEAVE getdata;
        END IF;
        
        -- Insert fetched data into student2
        INSERT INTO student2 (roll_no, name) VALUES (r, n);
    END LOOP getdata;
    
    -- Close cursor
    CLOSE c;
END //

DELIMITER ;
```

### **Explanation:**

1. **Declare Variables:**
   - `r` stores roll numbers.
   - `n` stores names.
   - `isFinished` is used to track when the cursor has no more data.
2. **Declare Cursor:**
   - A cursor `c` selects `roll_no` and `name` from `student1`.
3. **Declare Handler:**
   - When no more records exist, `isFinished` is set to `1`.
4. **Open Cursor & Fetch Data:**
   - The cursor is opened, and a loop starts fetching rows.
5. **Insert Data into **``**:**
   - Each fetched row is inserted into `student2`.
6. **Close Cursor:**
   - The cursor is closed after processing.



## **Step 6: Execute the Procedure**

Run the stored procedure to copy data.

```sql
CALL copy_record4();
```

## **Step 7: Verify Data in**

Check whether the data was copied successfully.

```sql
SELECT * FROM student2;
```

Expected Output:

```
+---------+---------+
| roll_no | name    |
+---------+---------+
|      10 | Sairaj  |
|      20 | Bhushan |
|      24 | atharva |
|      45 | Prnava  |
+---------+---------+
```


## **Step 8: Error Handling & Debugging**

### **Common Errors and Fixes:**

| Error Code | Issue                            | Solution                                    |
| ---------- | -------------------------------- | ------------------------------------------- |
| `1305`     | Procedure does not exist         | Ensure procedure was created correctly      |
| `1054`     | Unknown column in field list     | Check table column names match in procedure |
| `1064`     | SQL syntax error                 | Verify syntax and ensure correct delimiters |
| `42000`    | Syntax error in stored procedure | Ensure correct use of `DELIMITER`           |

### **Debugging Steps:**

1. Run `SHOW PROCEDURE STATUS WHERE Db = 'Db2';` to check stored procedure.
2. If `copy_record4()` does not exist, recreate it.
3. Verify `student2` exists and has the correct schema.
4. Check MySQL logs for detailed error messages.


## **Conclusion**

By following these steps, you will successfully:

- Create and use a MySQL cursor.
- Transfer records from one table to another.
- Handle potential errors and debug issues effectively.

This method is useful when processing large datasets or performing complex data transformations in MySQL stored procedures.

