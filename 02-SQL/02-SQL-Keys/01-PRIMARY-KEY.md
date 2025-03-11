# **Implementing a Primary Key in MySQL**

## **Overview**

A primary key is a unique identifier for each record in a MySQL table. It ensures that each record can be uniquely identified and prevents duplicate entries. The primary key is often used to establish relationships between tables.

## **Syntax**

```sql
CREATE TABLE table_name (
    column1_name DATA_TYPE CONSTRAINTS,
    column2_name DATA_TYPE CONSTRAINTS,
    PRIMARY KEY (column1_name)
);
```

### **Key Points:**

- `table_name` refers to the name of the table.
- `column_name` refers to the name of the column that will be the primary key.
- The primary key column must contain unique values and cannot be NULL.

---

## **Example: Creating a Table with a Primary Key**

Let’s assume we want to create a `users` table with a primary key on the `user_id` column:

```sql
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### **Expected Output:**

```plaintext
Query OK, 0 rows affected (0.02 sec)
```

This indicates that the table has been successfully created with a primary key.

---

## **Adding a Primary Key to an Existing Table**

If you have an existing table and want to add a primary key, use the `ALTER TABLE` statement:

```sql
ALTER TABLE users ADD PRIMARY KEY (user_id);
```

### **Expected Output:**

```plaintext
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

---

## **Verifying the Primary Key**

To verify that the primary key has been added, use the `DESCRIBE` statement:

```sql
DESCRIBE users;
```

### **Expected Output:**

```plaintext
+------------+--------------+------+-----+-------------------+----------------+
| Field      | Type         | Null | Key | Default           | Extra          |
+------------+--------------+------+-----+-------------------+----------------+
| user_id    | int(11)      | NO   | PRI | NULL              | auto_increment |
| username   | varchar(50)  | NO   |     | NULL              |                |
| email      | varchar(100) | NO   | UNI | NULL              |                |
| created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
+------------+--------------+------+-----+-------------------+----------------+
```

---

## **Best Practices for Using Primary Keys**

1. **Use Auto-Increment for Numeric Primary Keys** - This ensures unique values are automatically generated.
2. **Choose Columns with Unique Values** - Ensure the primary key column contains unique values.
3. **Avoid Using Composite Primary Keys** - Use a single column as the primary key whenever possible for simplicity.
4. **Index Primary Key Columns** - Primary keys are automatically indexed, improving query performance.
5. **Ensure Non-NULL Values** - Primary key columns cannot contain NULL values.

---

## **Conclusion**

Implementing a primary key in MySQL is essential for ensuring data integrity and establishing relationships between tables. By following best practices, you can effectively manage and query your database.
