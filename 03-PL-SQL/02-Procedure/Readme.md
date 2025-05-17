

# Getting Started with Stored Procedures in MySQL

## What is a Stored Procedure?

A **stored procedure** is a set of SQL statements that you save in the database and can execute (call) whenever needed. Think of it as a small program stored in the database.

##  Why Use Stored Procedures?

* **Automation:** Perform repetitive tasks like calculations or data insertion.
* **Efficiency:** Reduces the number of commands sent from an application.
* **Modularity:** Code is written once and reused multiple times.
* **Security:** Users can be given access to procedures instead of raw tables.

##  Basic Syntax

```sql
DELIMITER //

CREATE PROCEDURE procedure_name()
BEGIN
    -- Your SQL statements here
END;
//

DELIMITER ;
```

* `DELIMITER //`: Temporarily changes the statement terminator so the semicolon (`;`) can be used inside the procedure.
* `CREATE PROCEDURE`: Declares a new stored procedure.
* `BEGIN ... END`: Wraps the block of code inside the procedure.

## Simple Example: Adding Two Numbers

###  Procedure Code

```sql
DELIMITER //

CREATE PROCEDURE add_numbers()
BEGIN
    DECLARE a INT DEFAULT 5;
    DECLARE b INT DEFAULT 10;
    DECLARE result INT;

    SET result = a + b;

    SELECT result AS total;
END;
//

DELIMITER ;
```

###  What This Does

* Declares two numbers: `a = 5` and `b = 10`
* Adds them and stores the result in `result`
* Displays the result using `SELECT`

## How to Run This Stored Procedure

###  1. Using MySQL Terminal (Ubuntu/Windows)

```bash
mysql -u root -p
```

Then:

```sql
USE your_database;
SOURCE /path/to/add_numbers.sql;
CALL add_numbers();
```

Or paste the full procedure directly into the terminal.

###  2. Running from a `.sql` File

#### Step 1: Save as `add_numbers.sql`

```sql
-- add_numbers.sql
DELIMITER //

CREATE PROCEDURE add_numbers()
BEGIN
    DECLARE a INT DEFAULT 5;
    DECLARE b INT DEFAULT 10;
    DECLARE result INT;

    SET result = a + b;

    SELECT result AS total;
END;
//

DELIMITER ;
```

#### Step 2: Run It

##### Ubuntu Terminal

```bash
mysql -u root -p your_database < /full/path/to/add_numbers.sql
```

##### Windows CMD/PowerShell

```cmd
mysql -u root -p your_database < "C:\path\to\add_numbers.sql"
```

###  3. Calling the Procedure

Once created:

```sql
CALL add_numbers();
```

You will see:

```
+-------+
| total |
+-------+
|    15 |
+-------+
```

## Explanation of Key Elements

| Keyword          | Description                                                    |
| ---------------- | -------------------------------------------------------------- |
| `DECLARE`        | Used to define variables inside the procedure                  |
| `SET`            | Assigns a value to a variable                                  |
| `IF ... THEN`    | Adds conditional logic (like an `if` statement in programming) |
| `LOOP` / `WHILE` | Used for repeating blocks of code                              |
| `CALL`           | Executes (runs) the stored procedure                           |
| `SELECT`         | Displays output from the procedure                             |

## Folder Structure (Recommended)

```
mysql-procedures/
├── add_numbers.sql     # Your procedure file
├── README.md           # This guide
├── test_cases.sql      # Optional test scripts
```

## How to Remove or Modify a Procedure

* **Drop (delete) the procedure:**

  ```sql
  DROP PROCEDURE add_numbers;
  ```

* **View existing procedures:**

  ```sql
  SHOW PROCEDURE STATUS WHERE Db = 'your_database';
  ```

* **See the code of a procedure:**

  ```sql
  SHOW CREATE PROCEDURE add_numbers;
  ```

## Try It Yourself: Exercise

Create your own stored procedure named `show_date` that prints today’s date:

```sql
DELIMITER //

CREATE PROCEDURE show_date()
BEGIN
    SELECT CURDATE() AS today;
END;
//

DELIMITER ;

CALL show_date();
```
