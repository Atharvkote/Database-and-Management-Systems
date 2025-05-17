
# Conditional Statements in PL/SQL

## Overview

Conditional statements allow your PL/SQL program to make decisions and execute different code blocks based on conditions. They control the flow of execution.

## Types of Conditional Statements

### 1. IF Statement

Basic conditional execution.

```plsql
IF condition THEN
   -- statements
END IF;
```

### 2. IF-ELSE Statement

Executes one block if condition is true, else another block.

```plsql

IF condition THEN
   -- statements if true
ELSE
   -- statements if false
END IF;
```

### 3. IF-ELSIF-ELSE Statement

Multiple conditions checked in sequence.

```plsql
IF condition1 THEN
   -- statements
ELSIF condition2 THEN
   -- statements
ELSE
   -- statements
END IF;
```

## Example: Check Number Sign

```plsql
DECLARE
   v_num NUMBER := -10;
BEGIN
   IF v_num > 0 THEN
      DBMS_OUTPUT.PUT_LINE('Positive number');
   ELSIF v_num = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Zero');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Negative number');
   END IF;
END;
/
```

**Expected output:**

```
Negative number
```

## Usage Notes

* Conditions must evaluate to BOOLEAN (TRUE or FALSE).
* Logical operators supported: `AND`, `OR`, `NOT`.
* Comparison operators: `=`, `!=` (or `<>`), `<`, `>`, `<=`, `>=`.
* Use parentheses `()` to group conditions.

## Example: Check Grade Based on Marks

```plsql
DECLARE
   v_marks NUMBER := 75;
BEGIN
   IF v_marks >= 90 THEN
      DBMS_OUTPUT.PUT_LINE('Grade: A');
   ELSIF v_marks >= 75 THEN
      DBMS_OUTPUT.PUT_LINE('Grade: B');
   ELSIF v_marks >= 60 THEN
      DBMS_OUTPUT.PUT_LINE('Grade: C');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Grade: F');
   END IF;
END;
/
```

**Expected output:**

```
Grade: B
```

## Running the Code

Make sure to enable output:

```sql
SET SERVEROUTPUT ON;
```

Run the block in SQL\*Plus, SQL Developer, or other Oracle clients.

## Summary

* Use `IF` to check conditions.
* Use `ELSIF` for multiple conditions.
* Use `ELSE` for default case.
* Combine conditions with logical operators.

## Suggested Folder Structure

```
plsql-conditionals/
├── conditionals.sql   # Conditional examples
├── README.md          # This guide
```
