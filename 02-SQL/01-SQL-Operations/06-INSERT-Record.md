# **Inserting Data into a Table in MySQL**

## **Overview**

Inserting data into a MySQL table is a fundamental operation in database management. This step involves using the `INSERT INTO` statement to add new records to a table.

## **Syntax**

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

### **Key Points:**

- `table_name` refers to the name of the table where the data will be inserted.
- The column names must match the structure of the table.
- The values should be in the same order as the column names.
- If a column is auto-incremented (like `id`), you don’t need to explicitly insert a value for it.

---

## **Example: Inserting Data into the Users Table**

Let’s assume we have a `users` table with the following structure:

```sql
CREATE TABLE users (
    user_id INT ,
    username VARCHAR(50) ,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Now, we insert a new record:

```sql
INSERT INTO users (username, email) 
VALUES ('Atharva', 'ak@example.com');
```

### **Expected Output:**

```plaintext
Query OK, 1 row affected (0.01 sec)
```

This indicates that the data has been successfully inserted.

---

## **Verifying the Insertion**

To confirm that the data was added correctly, use the `SELECT` statement:

```sql
SELECT * FROM users;
```

### **Expected Output:**

```plaintext
+---------+-----------+----------------+---------------------+
| user_id | username  | email          | created_at          |
+---------+-----------+----------------+---------------------+
|       1 | Atharva   | ak@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
```

---

## **Inserting Multiple Records**

To insert multiple rows in one query, use:

```sql
INSERT INTO users (username, email) VALUES
('Bhushan', 'bk@example.com'),
('Sairaj', 'sk@example.com'),
('Pranav', 'pm@example.com');
```

### **Expected Output:**

```plaintext
Query OK, 3 rows affected (0.01 sec)
```

## **Verifying the Insertion**

To confirm that the data was added correctly, use the `SELECT` statement:

```sql
SELECT * FROM users;
```

### **Expected Output:**

```plaintext
+---------+-----------+----------------+---------------------+
| user_id | username  | email          | created_at          |
+---------+-----------+----------------+---------------------+
|       1 | Atharva   | ak@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
|       1 | Bhushan   | bk@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
|       1 | Sairaj    | sk@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
|       1 | Pranav    | pm@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
```
---

## **Conclusion**

The `INSERT INTO` statement is essential for adding records to a table. Using the correct syntax and verifying inserted data ensures smooth database operations.
