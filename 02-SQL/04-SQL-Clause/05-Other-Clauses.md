# **Comprehensive Guide to SQL Clauses**

## **1. FROM Clause: Specifying Data Source**

### **Overview**

The `FROM` clause specifies the table(s) from which the data is retrieved. It is a required component of a `SELECT` statement.

### **Basic Syntax**

```sql
SELECT column1, column2
FROM table_name;
```

### **Example**

```sql
SELECT name, email FROM Customers;
```

## **2. JOIN Clause: Combining Data from Multiple Tables**

### **Overview**

The `JOIN` clause retrieves data from multiple tables based on a related column.

### **Types of Joins**

- **INNER JOIN**: Returns only matching records in both tables.
- **LEFT JOIN**: Returns all records from the left table and matching records from the right table.
- **RIGHT JOIN**: Returns all records from the right table and matching records from the left table.
- **FULL JOIN**: Returns all records when there is a match in either table.

### **Example**

```sql
SELECT Customers.name, Orders.order_date
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;
```

## **3. HAVING Clause: Filtering Grouped Data**

### **Overview**

The `HAVING` clause filters data after applying the `GROUP BY` clause.

### **Basic Syntax**

```sql
SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```

### **Example**

```sql
SELECT department, COUNT(*)
FROM Employees
GROUP BY department
HAVING COUNT(*) > 5;
```

## **4. DISTINCT Clause: Removing Duplicate Records**

### **Overview**

The `DISTINCT` clause eliminates duplicate values from the result set.

### **Basic Syntax**

```sql
SELECT DISTINCT column_name FROM table_name;
```

### **Example**

```sql
SELECT DISTINCT city FROM Customers;
```

## **5. LIMIT Clause: Restricting Query Results**

### **Overview**

The `LIMIT` clause restricts the number of rows returned in a query result.

### **Basic Syntax**

```sql
SELECT column1, column2 FROM table_name LIMIT number;
```

### **Example**

```sql
SELECT name FROM Employees LIMIT 5;
```

## **6. UNION Clause: Combining Multiple Query Results**

### **Overview**

The `UNION` clause combines results from multiple `SELECT` statements, removing duplicates.

### **Basic Syntax**

```sql
SELECT column1 FROM table1
UNION
SELECT column1 FROM table2;
```

### **Example**

```sql
SELECT city FROM Customers
UNION
SELECT city FROM Suppliers;
```

## **7. CASE Statement: Conditional Logic in Queries**

### **Overview**

The `CASE` statement adds conditional logic within a `SELECT` query.

### **Basic Syntax**

```sql
SELECT column_name,
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE result3
    END AS alias_name
FROM table_name;
```

### **Example**

```sql
SELECT name, salary,
    CASE
        WHEN salary > 70000 THEN 'High'
        WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;
```

## **8. EXISTS Clause: Checking for Existence of Records**

### **Overview**

The `EXISTS` clause checks if a subquery returns any rows.

### **Basic Syntax**

```sql
SELECT column1 FROM table_name
WHERE EXISTS (SELECT column2 FROM another_table WHERE condition);
```

### **Example**

```sql
SELECT name FROM Customers
WHERE EXISTS (SELECT * FROM Orders WHERE Orders.customer_id = Customers.customer_id);
```

## **9. IN Clause: Matching Against a Set of Values**

### **Overview**

The `IN` clause allows filtering based on multiple values.

### **Basic Syntax**

```sql
SELECT column1 FROM table_name WHERE column1 IN (value1, value2, ...);
```

### **Example**

```sql
SELECT name FROM Employees WHERE department IN ('IT', 'HR', 'Sales');
```

## **10. BETWEEN Clause: Selecting a Range of Values**

### **Overview**

The `BETWEEN` clause filters data within a specified range.

### **Basic Syntax**

```sql
SELECT column_name FROM table_name WHERE column_name BETWEEN value1 AND value2;
```

### **Example**

```sql
SELECT name, salary FROM Employees WHERE salary BETWEEN 40000 AND 70000;
```

## **11. LIKE Clause: Pattern Matching**

### **Overview**

The `LIKE` clause searches for a specified pattern in a column.

### **Basic Syntax**

```sql
SELECT column1 FROM table_name WHERE column1 LIKE 'pattern';
```

### **Example**

```sql
SELECT name FROM Customers WHERE name LIKE 'A%'; -- Names starting with 'A'
```

## **12. IS NULL Clause: Checking for NULL Values**

### **Overview**

The `IS NULL` clause checks if a column contains NULL values.

### **Basic Syntax**

```sql
SELECT column1 FROM table_name WHERE column1 IS NULL;
```

### **Example**

```sql
SELECT name FROM Employees WHERE salary IS NULL;
```

## **Conclusion**

This guide provides an in-depth look at various SQL clauses beyond `SELECT`, `WHERE`, `GROUP BY`, and `ORDER BY`. Mastering these clauses will help in writing efficient queries, retrieving precise data, and optimizing database performance.
