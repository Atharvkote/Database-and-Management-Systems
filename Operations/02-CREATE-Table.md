## **Step 3: Creating a Table in SQL**  

### **Defining a Table with Appropriate Data Types and Constraints**  

In SQL, a table is created using the `CREATE TABLE` statement. It consists of column names, data types, and constraints to enforce data integrity.

#### **General Syntax:**  

```sql
CREATE TABLE table_name (
    column1_name DATA_TYPE CONSTRAINTS,
    column2_name DATA_TYPE CONSTRAINTS,
    column3_name DATA_TYPE CONSTRAINTS
);
```

- `table_name`: The name of the table.
- `column_name`: The name of each column.
- `DATA_TYPE`: Specifies the type of data the column will hold (e.g., `INT`, `VARCHAR`, `TIMESTAMP`).
- `CONSTRAINTS`: Defines rules for data validation (e.g., `PRIMARY KEY`, `NOT NULL`, `UNIQUE`).

### **Example: Creating a `users` Table**  

The following example creates a `users` table with four columns:

```sql
CREATE TABLE users (
    user_id INT ,
    username VARCHAR(50),  
    email VARCHAR(100),       
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Stores the date and time of account creation
);
```

### **Checking Table Structure**  

After creating a table, use the `DESC` command to verify its structure:

```sql
DESC users;
```

### **Expected Output:**  

```plaintext
+------------+--------------+------+-----+-------------------+----------------+
| Field      | Type         | Null | Key | Default           | Extra          |
+------------+--------------+------+-----+-------------------+----------------+
| user_id    | int(11)      | NO   |     | NULL              |                |
| username   | varchar(50)  | NO   |     | NULL              |                |
| email      | varchar(100) | NO   |     | NULL              |                |
| created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
+------------+--------------+------+-----+-------------------+----------------+
```

### **Retrieving Data from the Table**  

To view all records in a table, use:

```sql
SELECT * FROM users;
```

### **Expected Output (Example Data):**  

```plaintext
+---------+------------+---------------------+---------------------+
| user_id | username   | email               | created_at          |
+---------+------------+---------------------+---------------------+
| 1       | Bhushan    | alice@example.com   | 2025-03-11 10:00:00 |
| 2       | Atharva    | bob@example.com     | 2025-03-11 10:05:00 |
+---------+------------+---------------------+---------------------+
```

### **Basic SQL Tips:**  

✅ **Always name your table and columns clearly** to make them easy to understand.
✅ **Use `DESC table_name;`** to check the structure of your table.
✅ **Use `SELECT * FROM table_name;`** to retrieve all data from a table.
✅ **Keep column names lowercase with underscores (`_`)** for readability.
✅ **Test queries in a local database before applying changes.**
