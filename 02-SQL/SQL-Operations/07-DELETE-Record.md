# **Deleting Data from a Table in MySQL**

## **Overview**

Deleting data from a MySQL table is a crucial operation in database management. This step involves using the `DELETE` statement to remove specific records from a table.

## **Syntax**

```sql
DELETE FROM table_name WHERE condition;
```

### **Key Points:**

- `table_name` refers to the name of the table from which the data will be deleted.
- The `WHERE` clause specifies which records should be deleted.
- Omitting the `WHERE` clause will delete all rows from the table.
- Use `LIMIT` to restrict the number of rows deleted in a single query.

---

## **Example: Deleting Data from the Users Table**

Let’s assume we have a `users` table with the following structure:


```sql
CREATE TABLE users (
    user_id INT ,
    username VARCHAR(50) ,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Now, we delete a specific record:

```sql
DELETE FROM users WHERE username = 'Atharva';
```

### **Expected Output:**

```plaintext
Query OK, 1 row affected (0.01 sec)
```

This indicates that the data has been successfully deleted.

---

## **Verifying the Deletion**

To confirm that the data was removed correctly, use the `SELECT` statement:

```sql
SELECT * FROM users;
```

### **Expected Output:**

```plaintext
+---------+-----------+----------------+---------------------+
| user_id | username  | email          | created_at          |
+---------+-----------+----------------+---------------------+
|       2 | Bhushan   | bk@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
|       3 | Sairaj    | sk@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
|       4 | Pranav    | pm@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
```

---

## **Deleting Multiple Records**

To delete multiple rows that meet a certain condition, use:

```sql
DELETE FROM users WHERE username IN ('Bhushan', 'Sairaj');
```

### **Expected Output:**

```plaintext
Query OK, 2 rows affected (0.01 sec)
```

## **Verifying the Deletion**

To confirm that the data was removed correctly, use:

```sql
SELECT * FROM users;
```

### **Expected Output:**

```plaintext
+---------+-----------+----------------+---------------------+
| user_id | username  | email          | created_at          |
+---------+-----------+----------------+---------------------+
|       4 | Pranav    | pm@example.com | 2025-03-11 12:00:00 |
+---------+-----------+----------------+---------------------+
```

---

## **Deleting All Records from a Table**

To remove all records from a table without deleting its structure:

```sql
DELETE FROM users;
```

or

```sql
TRUNCATE TABLE users;
```

### **Differences Between DELETE and TRUNCATE:**

| DELETE                          | TRUNCATE                           |
|----------------------------------|------------------------------------|
| Can be rolled back (if using transactions) | Cannot be rolled back             |
| Deletes row by row              | Removes all rows at once          |
| Triggers are executed           | Triggers are not executed         |
| Slower for large tables         | Faster for large tables           |

---

## **Conclusion**

The `DELETE` statement is essential for removing specific records from a table, while `TRUNCATE` is useful for clearing all records efficiently. Proper use of the `WHERE` clause ensures that only the intended data is deleted.
