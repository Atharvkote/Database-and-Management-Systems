
## Writing and Running a Stored Procedure (MySQL) – Fine Calculation Example

This guide shows how to define and execute a stored procedure in MySQL that calculates fines based on a book's issue date and stores the result.

## 1. Prerequisites

* MySQL installed and running
* Two tables:

  * `lib(roll INT, book_name VARCHAR, issue_date DATE)`
  * `fine(roll INT, amount INT)`
* Access to MySQL (`mysql -u root -p`)

## 2. MySQL Stored Procedure: `calc_fine144`

### Procedure Logic

* Loops through records in the `lib` table
* Calculates `DATEDIFF` between `CURDATE()` and `issue_date`
* Determines fine based on the number of overdue days
* Inserts the fine amount into the `fine` table

## 3. Procedure Code

### Directly in MySQL Terminal

```sql
DELIMITER //

CREATE PROCEDURE calc_fine144()
BEGIN
    DECLARE r INT;
    DECLARE n VARCHAR(255);
    DECLARE d DATE;
    DECLARE diff INT DEFAULT 0;
    DECLARE amt INT DEFAULT 0;
    DECLARE vfinished INT DEFAULT 0;

    DECLARE cur CURSOR FOR SELECT roll, book_name, issue_date FROM lib;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET vfinished = 1;

    OPEN cur;

    getdata: LOOP
        FETCH cur INTO r, n, d;
        IF vfinished = 1 THEN
            LEAVE getdata;
        END IF;

        SET diff = DATEDIFF(CURDATE(), d);

        IF diff > 5 AND diff <= 15 THEN 
            SET amt = diff * 5;
        ELSEIF diff > 15 AND diff <= 30 THEN
            SET amt = diff * 10;
        ELSEIF diff > 30 THEN
            SET amt = diff * 20;
        ELSE
            SET amt = 0;
        END IF;

        INSERT INTO fine(roll, amount) VALUES(r, amt);
    END LOOP;

    CLOSE cur;
END;
//

DELIMITER ;
```

## 4. Running from a `.sql` File

### Step 1: Save as `calc_fine.sql`

```sql
-- calc_fine.sql
DELIMITER //

CREATE PROCEDURE calc_fine144()
BEGIN
    DECLARE r INT;
    DECLARE n VARCHAR(255);
    DECLARE d DATE;
    DECLARE diff INT DEFAULT 0;
    DECLARE amt INT DEFAULT 0;
    DECLARE vfinished INT DEFAULT 0;

    DECLARE cur CURSOR FOR SELECT roll, book_name, issue_date FROM lib;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET vfinished = 1;

    OPEN cur;

    getdata: LOOP
        FETCH cur INTO r, n, d;
        IF vfinished = 1 THEN
            LEAVE getdata;
        END IF;

        SET diff = DATEDIFF(CURDATE(), d);

        IF diff > 5 AND diff <= 15 THEN 
            SET amt = diff * 5;
        ELSEIF diff > 15 AND diff <= 30 THEN
            SET amt = diff * 10;
        ELSEIF diff > 30 THEN
            SET amt = diff * 20;
        ELSE
            SET amt = 0;
        END IF;

        INSERT INTO fine(roll, amount) VALUES(r, amt);
    END LOOP;

    CLOSE cur;
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
SOURCE /full/path/to/calc_fine.sql;
```

**B. From Terminal:**

```bash
mysql -u root -p your_database < /full/path/to/calc_fine.sql
```

#### Windows

**From CMD/PowerShell:**

```cmd
mysql -u root -p your_database < "C:\path\to\calc_fine.sql"
```

Or inside MySQL:

```sql
USE your_database;
SOURCE C:/path/to/calc_fine.sql;
```

## 5. Calling the Procedure

```sql
CALL calc_fine144();
```

## 6. Verifying the Output

Check the `fine` table:

```sql
SELECT * FROM fine;
```

## 7. Additional Commands

| Command                                       | Description                 |
| --------------------------------------------- | --------------------------- |
| `SHOW PROCEDURE STATUS WHERE Db = 'your_db';` | Lists all stored procedures |
| `DROP PROCEDURE calc_fine144;`                | Deletes the procedure       |
| `DELIMITER //`                                | Changes statement delimiter |
| `SOURCE path/to/file.sql`                     | Executes an SQL script      |

## 8. Folder Structure Suggestion

```
plsql-demo/
├── calc_fine.sql        # Stored procedure script
├── README.md            # Documentation
├── sample_data.sql      # Optional: insert test data
```
