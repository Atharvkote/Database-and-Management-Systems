
## Writing and Running PL/SQL-Style Blocks (MySQL) on Ubuntu & Windows

This guide explains how to write and run PL/SQL-style blocks (stored procedures/functions) using:

* MySQL terminal (direct input)
* SQL files (external scripts)

Covers both **Ubuntu (Linux)** and **Windows** environments.

## Prerequisites

| Requirement        | Ubuntu / Windows                                                                                                  |
| ------------------ | ----------------------------------------------------------------------------------------------------------------- |
| MySQL Installed    | Ubuntu: `sudo apt install mysql-server`<br>Windows: [MySQL Installer](https://dev.mysql.com/downloads/installer/) |
| Access to MySQL    | Command: `mysql -u root -p`                                                                                       |
| A database created | Example: `CREATE DATABASE testdb;`                                                                                |

## Step 1: Open MySQL Terminal

**Ubuntu:**

```bash
sudo mysql -u root -p
```

**Windows (Command Prompt or PowerShell):**

```bash
mysql -u root -p
```

Enter your MySQL root password when prompted.

## Step 2: Use or Create a Database

```sql
CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
```

## Step 3: Write and Execute PL/SQL Block (Function)

### Option A: Directly in MySQL Terminal (Ubuntu & Windows)

```sql
DELIMITER //

CREATE FUNCTION func1(a INT, b INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE c INT;
    SET c = a + b;
    RETURN c;
END
//

DELIMITER ;

-- Test the function
SELECT func1(10, 20);
```

## Step 4: Writing and Executing from a `.sql` File

### 1. Create the File `function.sql`

```sql
-- function.sql
DELIMITER //

CREATE FUNCTION func1(a INT, b INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE c INT;
    SET c = a + b;
    RETURN c;
END
//

DELIMITER ;
```

### 2. Run the File

**Ubuntu:**

**A. Inside MySQL Terminal (using `SOURCE`):**

```bash
mysql -u root -p
```

Inside MySQL:

```sql
USE testdb;
SOURCE /full/path/to/function.sql;
```

To get the full path of the file:

```bash
realpath function.sql
```

**B. From Linux Shell:**

```bash
mysql -u root -p testdb < /full/path/to/function.sql
```

**Windows:**

**From Command Prompt or PowerShell:**

```cmd
mysql -u root -p testdb < "C:\full\path\to\function.sql"
```

Or inside MySQL:

```sql
USE testdb;
SOURCE C:/full/path/to/function.sql;
```

## Step 5: Call the Function

```sql
USE testdb;
SELECT func1(5, 7);
```

Expected output:

```
+-------------+
| func1(5, 7) |
+-------------+
|          12 |
+-------------+
```

## Useful Commands

| Command                                     | Description                                  |
| ------------------------------------------- | -------------------------------------------- |
| `SHOW FUNCTION STATUS WHERE Db = 'testdb';` | List all user-defined functions              |
| `DROP FUNCTION func1;`                      | Delete the function                          |
| `DELIMITER //`                              | Change the statement delimiter               |
| `SOURCE path/to/file.sql`                   | Execute SQL script inside the MySQL terminal |

## Recommended Folder Structure

```
plsql-demo/
├── function.sql       # Your SQL script
├── README.md          # This guide
```
