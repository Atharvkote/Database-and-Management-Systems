# Iterative Statements (Loops) in PL/SQL

## Overview

Iterative statements allow you to repeat a block of code multiple times until a condition is met. PL/SQL supports several types of loops:

- **Basic LOOP**
- **WHILE LOOP**
- **FOR LOOP**

## 1. Basic LOOP

Repeats indefinitely until explicitly exited using `EXIT` or `LEAVE`.

```plsql
DECLARE
   v_counter NUMBER := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);
      v_counter := v_counter + 1;
      IF v_counter > 5 THEN
         EXIT;  -- Exit the loop
      END IF;
   END LOOP;
END;
/
```

**Output:**

```
Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5
```

## 2. WHILE LOOP

Repeats as long as the condition is true.

```plsql
DECLARE
   v_counter NUMBER := 1;
BEGIN
   WHILE v_counter <= 5 LOOP
      DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);
      v_counter := v_counter + 1;
   END LOOP;
END;
/
```

**Output:**

```
Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5
```

## 3. FOR LOOP

Repeats for a fixed number of iterations with a loop variable.

```plsql
BEGIN
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
   END LOOP;
END;
/
```

**Output:**

```
Iteration: 1
Iteration: 2
Iteration: 3
Iteration: 4
Iteration: 5
```

## 4. EXIT WHEN

You can exit loops with the `EXIT WHEN` statement for cleaner code.

Example with a basic loop:

```plsql
DECLARE
   v_counter NUMBER := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Count: ' || v_counter);
      v_counter := v_counter + 1;
      EXIT WHEN v_counter > 5;
   END LOOP;
END;
/
```

## Running the Code

Remember to enable output before running:

```sql
SET SERVEROUTPUT ON;
```

Run the PL/SQL block in SQL\*Plus, SQL Developer, or any Oracle client.

## Summary

| Loop Type   | Description                                       |
| ----------- | ------------------------------------------------- |
| `LOOP`      | Basic loop, exits manually with `EXIT` or `LEAVE` |
| `WHILE`     | Loops while condition is TRUE                     |
| `FOR`       | Loops for a fixed range                           |
| `EXIT WHEN` | Condition to exit the loop                        |

## Suggested Folder Structure

```
plsql-loops/
├── loops.sql          # Loop examples
├── README.md          # This guide
```

## Exercise Idea

Write a procedure that prints the first 10 Fibonacci numbers using a loop.

