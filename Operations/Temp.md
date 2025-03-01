
# MySQL Table Operations: `boys` Table Example

This README explains how to create and manipulate a MySQL table, specifically the `boys` table, step by step. It includes commands for database creation, table creation, data insertion, and data updates.

## Step 1: Create a Database
```sql
CREATE DATABASE SYB;
```

Verify the creation of the database:
```sql
SHOW DATABASES;
```

## Step 2: Use the Database
```sql
USE SYB;
```

## Step 3: Create a Table
Attempt to create a table with missing columns:
```sql
CREATE TABLE boys;
```
Error:
```
ERROR 4028 (HY000): A table must have at least one visible column.
```

Create the table with the necessary columns:
```sql
CREATE TABLE boys (roll_no INT, name VARCHAR(20), prn VARCHAR(20));
```

Verify table structure:
```sql
DESC boys;
```

## Step 4: Insert Data into the Table
```sql
INSERT INTO boys VALUES (71, "Bharat", "UCS23M1074"), 
                        (72, "Bhushan", "UCS23M1074"),
                        (73, "Atharva", "UCS23M1074");
```

Verify the data:
```sql
SELECT * FROM boys;
```

## Step 5: Alter the Table Structure

Add a new column `second_name`:
```sql
ALTER TABLE boys ADD (second_name VARCHAR(30));
```

Verify the updated structure:
```sql
DESC boys;
```

Add another column `last_name`:
```sql
ALTER TABLE boys ADD (last_name VARCHAR(30));
```

Verify the structure again:
```sql
DESC boys;
```

## Step 6: Update Data in the Table

Update the `second_name` and `last_name` columns for specific records:
```sql
UPDATE boys SET second_name = 'Sampat' WHERE roll_no = 71;
UPDATE boys SET second_name = 'Tatyasaheb' WHERE roll_no = 72;
UPDATE boys SET second_name = 'Mininath' WHERE roll_no = 73;
```

Verify the updated data:
```sql
SELECT * FROM boys;
```

Update the `last_name` for each record:
```sql
UPDATE boys SET last_name = 'Kolhe' WHERE roll_no = 71;
UPDATE boys SET last_name = 'Korde' WHERE roll_no = 72;
UPDATE boys SET last_name = 'Kote' WHERE roll_no = 73;
```

Verify the final data:
```sql
SELECT * FROM boys;
```

## Final Table Structure
The final structure and data of the `boys` table is as follows:

| roll_no | name    | prn        | second_name | last_name |
|---------|---------|------------|-------------|-----------|
| 71      | Bharat  | UCS23M1074 | Sampat      | Kolhe     |
| 72      | Bhushan | UCS23M1074 | Tatyasaheb  | Korde     |
| 73      | Atharva | UCS23M1074 | Mininath    | Kote      |

## Conclusion
This example shows how to create a database, a table, insert data, alter the table structure, and update data using MySQL.
```

### Key Points:
- This README provides a step-by-step guide for MySQL operations.
- It demonstrates how to create a database, create a table, insert data, alter the table structure, and update specific records.

Feel free to adapt this README for your project or personal reference!
