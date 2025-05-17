
# Accepting Input and Displaying Output in PL/SQL

## What is PL/SQL?

PL/SQL (Procedural Language/SQL) is Oracle’s procedural extension to SQL. It allows you to write blocks of code with variables, logic, and more, that run inside the database.

## Basic PL/SQL Block Structure

```plsql
DECLARE
   -- Variable declarations
BEGIN
   -- Executable code
END;
/
```

* The `DECLARE` section is optional but used to declare variables.
* The `BEGIN ... END;` block contains the executable statements.
* The trailing `/` runs the block in tools like SQL\*Plus or SQL Developer.

## Accepting Input in PL/SQL

PL/SQL does **not** support interactive user input during execution like some programming languages. Instead, input is given by:

* Assigning values to variables inside the block.
* Passing parameters to procedures or functions.

Example of variable assignment:

```plsql
DECLARE
    v_name VARCHAR2(50);
BEGIN
    v_name := 'Atharva';
    DBMS_OUTPUT.PUT_LINE('Hello, ' || v_name);
END;
/
```

## Displaying Output in PL/SQL

* Use `DBMS_OUTPUT.PUT_LINE` to print text or variable values.
* Before running, enable output display:

```sql
SET SERVEROUTPUT ON;
```

This is needed in SQL\*Plus, SQL Developer, or other Oracle clients.

## Example: Adding Two Numbers and Displaying Result

```plsql
DECLARE
    v_num1 NUMBER := 10;
    v_num2 NUMBER := 20;
    v_sum NUMBER;
BEGIN
    v_sum := v_num1 + v_num2;
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || v_sum);
END;
/
```

**Expected output:**

Sum is: 30


## Running PL/SQL Code

### In SQL\*Plus or Terminal:

1. Save your PL/SQL block in a file, e.g. `input_output.sql`.
2. Run it using:

```bash
sqlplus username/password@database @input_output.sql
```

### In SQL Developer:

* Paste the code into the worksheet.
* Click "Run" or press F5.

## Summary

* Use `DECLARE` to define variables.
* Assign values to variables inside `BEGIN ... END`.
* Use `DBMS_OUTPUT.PUT_LINE` to print output.
* Enable server output display with `SET SERVEROUTPUT ON`.

## Suggested Folder Structure

```
plsql-io/
├── input_output.sql   # PL/SQL block examples
├── README.md          # This guide
```
