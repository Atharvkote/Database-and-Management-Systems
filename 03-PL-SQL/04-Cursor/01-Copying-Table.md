## Writing and Running a Cursor (PL-SQL) – Cursor Example for Copying Data

This guide shows how to define and execute a stored procedure in MySQL that reads data from one table row-by-row using a cursor.

## 1. Prerequisites

* MySQL installed and running
* A source table:

  * `student1(rollno1 INT, names1 VARCHAR(20), class1 VARCHAR(20))`
* Access to MySQL (`mysql -u root -p`)

## 2. MySQL Stored Procedure: `copy_proc`

### Procedure Logic

* Declares a cursor to fetch rows from `student1`
* Loops through each row
* Fetches column values into variables
* (Optional) Processes or copies data — here just selecting for demo
* Exits loop when no more rows are available

## 3. Procedure Code

### Directly in MySQL Terminal

```sql
DELIMITER //

CREATE PROCEDURE copy_proc()
BEGIN
    DECLARE r INT;
    DECLARE n VARCHAR(20);
    DECLARE c VARCHAR(20);
    DECLARE vfinished INT DEFAULT 0;

    DECLARE stud_cur CURSOR FOR SELECT rollno1, names1, class1 FROM student1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET vfinished = 1;

    OPEN stud_cur;

    getdata: LOOP
        FETCH stud_cur INTO r, n, c;
        IF vfinished = 1 THEN
            LEAVE getdata;
        END IF;

        -- Example operation: just selecting fetched data here
        SELECT r AS RollNo, n AS Name, c AS Class;
    END LOOP getdata;

    CLOSE stud_cur;
END;
//

DELIMITER ;
```

## 4. Running from a `.sql` File

### Step 1: Save as `copy_proc.sql`

```sql
-- copy_proc.sql
DELIMITER //

CREATE PROCEDURE copy_proc()
BEGIN
    DECLARE r INT;
    DECLARE n VARCHAR(20);
    DECLARE c VARCHAR(20);
    DECLARE vfinished INT DEFAULT 0;

    DECLARE stud_cur CURSOR FOR SELECT rollno1, names1, class1 FROM student1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET vfinished = 1;

    OPEN stud_cur;

    getdata: LOOP
        FETCH stud_cur INTO r, n, c;
        IF vfinished = 1 THEN
            LEAVE getdata;
        END IF;

        SELECT r AS RollNo, n AS Name, c AS Class;
    END LOOP getdata;

    CLOSE stud_cur;
END;
//

DELIMITER ;
```

### Step 2: Execute the File

#### Ubuntu

**A. Inside MySQL Terminal:**

```bash
mysql -u root -p
```

Then:

```sql
USE your_database;
SOURCE /full/path/to/copy_proc.sql;
```

**B. From Terminal:**

```bash
mysql -u root -p your_database < /full/path/to/copy_proc.sql
```

#### Windows

**From CMD/PowerShell:**

```cmd
mysql -u root -p your_database < "C:\path\to\copy_proc.sql"
```

Or inside MySQL:

```sql
USE your_database;
SOURCE C:/path/to/copy_proc.sql;
```

## 5. Calling the Procedure

```sql
CALL copy_proc();
```

## 6. Verifying the Output

Since this example only selects data in the loop, you will see the rows printed one by one in the console.

## 7. Additional Commands

| Command                                       | Description                 |
| --------------------------------------------- | --------------------------- |
| `SHOW PROCEDURE STATUS WHERE Db = 'your_db';` | Lists all stored procedures |
| `DROP PROCEDURE copy_proc;`                   | Deletes the procedure       |
| `DELIMITER //`                                | Changes statement delimiter |
| `SOURCE path/to/file.sql`                     | Executes an SQL script      |

## 8. Folder Structure Suggestion

```
plsql-demo/
├── copy_proc.sql       # Stored procedure script
├── README.md           # Documentation
├── sample_data.sql     # Optional: insert test data
```
