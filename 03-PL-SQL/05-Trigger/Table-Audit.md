
# Writing and Running a MySQL Trigger – Example for `after_insert_stud1`

This guide explains how to create and use a MySQL **trigger** that automatically logs insertions made on a table.

## 1. What is a Trigger?

A **trigger** is a special type of stored program in MySQL that automatically runs (fires) when certain events occur on a table, such as:

* `INSERT`
* `UPDATE`
* `DELETE`

Triggers are used to enforce business rules, audit changes, or automate tasks without modifying application code.

## 2. Example Trigger: `after_insert_stud1`

### Goal:

When a new row is inserted into the `stud1` table, the trigger automatically inserts a log record into the `stud1_log` table.

## 3. Prerequisites

You need two tables:

* `stud1(id INT, name VARCHAR(50), issued_date DATE)`
* `stud1_log(id INT, name VARCHAR(50), idate DATE)`

## 4. Trigger Code

### Creating the Trigger in MySQL Terminal

```sql
DELIMITER //

CREATE TRIGGER after_insert_stud1
AFTER INSERT ON stud1
FOR EACH ROW
BEGIN
    INSERT INTO stud1_log (id, name, idate)
    VALUES (NEW.id, NEW.name, NEW.issued_date);
END;
//

DELIMITER ;
```

### Explanation:

* `DELIMITER //` — Changes the statement delimiter to `//` so semicolons can be used inside the trigger.
* `CREATE TRIGGER after_insert_stud1` — Defines a new trigger named `after_insert_stud1`.
* `AFTER INSERT ON stud1` — The trigger fires **after** a new row is inserted into `stud1`.
* `FOR EACH ROW` — The trigger runs once for every inserted row.
* Inside `BEGIN ... END`, the trigger inserts corresponding data into `stud1_log`.
* `NEW.column_name` refers to the values of the newly inserted row in `stud1`.
* `DELIMITER ;` — Resets delimiter back to default.

## 5. How to Run the Trigger

### Step 1: Create the Tables (if not exist)

```sql
CREATE TABLE stud1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    issued_date DATE
);

CREATE TABLE stud1_log (
    id INT,
    name VARCHAR(50),
    idate DATE
);
```

### Step 2: Create the Trigger (run the trigger code above)

### Step 3: Insert a Row into `stud1`

```sql
INSERT INTO stud1 (id, name, issued_date) VALUES (101, 'Atharva', CURDATE());
```

### Step 4: Verify the Log Table

```sql
SELECT * FROM stud1_log;
```

You should see the inserted record logged automatically.

## 6. Important Notes

* Use `NEW.column_name` to access new row data in `INSERT` and `UPDATE` triggers.
* For `DELETE` triggers, use `OLD.column_name` to access deleted row data.
* Triggers cannot commit or rollback transactions — they run within the transaction scope.
* Be careful with trigger logic to avoid infinite loops (e.g., an `INSERT` trigger that inserts into the same table).

## 7. Deleting the Trigger

```sql
DROP TRIGGER IF EXISTS after_insert_stud1;
```

## 8. Folder Structure (Recommended)

```
mysql-triggers/
├── create_tables.sql    # Table creation scripts
├── after_insert_stud1.sql  # Trigger creation script
├── README.md            # This guide
```
