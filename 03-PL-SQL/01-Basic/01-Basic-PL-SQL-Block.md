
### **Introduction to PL/SQL Block (or Stored Program Block)**

In SQL-based databases like MySQL, **stored programs** are blocks of code that you write once and use multiple times. These include:

* **Stored Procedures**
* **Stored Functions**
* **Cursors**
* **Triggers**

These blocks of code are written using a structure similar to **PL/SQL** (used in Oracle), and they help automate repetitive tasks, apply business logic, and improve performance by executing logic closer to the data.

### **Basic Structure of a Stored Function (Example Explanation)**

```sql
delimiter //

create function func1(a int, b int) returns int
deterministic
begin
    declare c int;
    set c = a + b;
    return c;
end
//
```

This is a **stored function** in MySQL. Let's break it down:

| Part                         | Explanation                                                                                                          |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `delimiter //`               | Changes the command delimiter so that the function body can include semicolons (`;`).                                |
| `create function func1(...)` | Declares a new function named `func1` with two input parameters `a` and `b`.                                         |
| `returns int`                | Specifies that the function will return an `int` (integer) value.                                                    |
| `deterministic`              | Means the function always gives the same output for the same inputs.                                                 |
| `begin ... end`              | Defines the **block of code** that will be executed when the function is called. This is the **PL/SQL-style block**. |
| `declare c int;`             | Declares a local variable `c` inside the block.                                                                      |
| `set c = a + b;`             | Performs an operation using input parameters and stores the result.                                                  |
| `return c;`                  | Returns the result of the function.                                                                                  |
| `//`                         | Ends the function definition with the new delimiter.                                                                 |

### **Summary of Block Structure**

A typical PL/SQL-style block in MySQL has:

1. **Header** – Function or procedure declaration.
2. **Declaration Section** – Variables are declared using `DECLARE`.
3. **Execution Section** – Logic and SQL statements are written here.
4. **Return (for functions)** – A value is returned to the caller.

### **Calling the Function**

You can call this function in a SQL query like this:

```sql
SELECT func1(10, 20);  -- Output will be 30
```

