
# Understanding MySQL Triggers – A Complete Guide

## What is a Trigger?

A **trigger** is a special kind of stored program in MySQL that automatically executes (or “fires”) in response to certain events on a table, such as:

* **INSERT** (when a new row is added)
* **UPDATE** (when an existing row is modified)
* **DELETE** (when a row is removed)

Triggers help automate database actions, enforce data integrity, audit changes, and implement complex business rules directly inside the database.

## Why Use Triggers?

* **Automation:** Automatically perform actions on data changes without manual intervention.
* **Data Integrity:** Enforce complex rules that are difficult to implement at the application level.
* **Auditing:** Keep a history or log of data changes for security and compliance.
* **Consistency:** Ensure related tables stay synchronized when data changes.
* **Centralized Logic:** Put important business logic in the database to reduce duplication.

## Types of Triggers

Triggers are classified by:

| Timing | Event  | Description                                     |
| ------ | ------ | ----------------------------------------------- |
| BEFORE | INSERT | Executes before a new row is inserted           |
| AFTER  | INSERT | Executes after a new row has been inserted      |
| BEFORE | UPDATE | Executes before an existing row is updated      |
| AFTER  | UPDATE | Executes after an existing row has been updated |
| BEFORE | DELETE | Executes before a row is deleted                |
| AFTER  | DELETE | Executes after a row has been deleted           |

## Trigger Syntax (Basic)

```sql
DELIMITER //

CREATE TRIGGER trigger_name
    { BEFORE | AFTER } { INSERT | UPDATE | DELETE }
    ON table_name
    FOR EACH ROW
BEGIN
    -- Trigger logic here
END;
//

DELIMITER ;
```

* `DELIMITER //` changes the statement delimiter so that semicolons can be used inside the trigger.
* `FOR EACH ROW` means the trigger runs once for every affected row.
* Trigger logic is written inside the `BEGIN ... END` block.

## Accessing Row Data in Triggers

* For **INSERT** triggers, use the keyword `NEW` to access the new row’s column values.

  ```sql
  SET NEW.column_name = value;
  ```

* For **UPDATE** triggers, use both `OLD` (for old values) and `NEW` (for new values).

  ```sql
  SET NEW.column_name = value;
  SELECT OLD.column_name;
  ```

* For **DELETE** triggers, use `OLD` to access the deleted row’s data.

## Example: Audit Log Trigger

Log every insert into `employees` table by recording the event in `employees_log` table.

```sql
DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employees_log(emp_id, action, action_date)
    VALUES (NEW.emp_id, 'INSERT', NOW());
END;
//

DELIMITER ;
```

## Important Notes About Triggers

* Triggers run inside the transaction scope — they cannot commit or rollback independently.
* Avoid recursive triggers that cause infinite loops.
* Be mindful of performance, as triggers add overhead to data modifications.
* Triggers cannot directly return results to clients, but they can modify data or write logs.
* MySQL supports only row-level triggers (`FOR EACH ROW`), not statement-level.

## How to Manage Triggers

| Command                             | Description                               |
| ----------------------------------- | ----------------------------------------- |
| `SHOW TRIGGERS;`                    | List all triggers in the current database |
| `DROP TRIGGER trigger_name;`        | Remove a trigger                          |
| `SHOW CREATE TRIGGER trigger_name;` | Show trigger definition                   |

## Common Use Cases

* Enforcing business rules (e.g., prevent negative stock)
* Maintaining audit trails and logs
* Synchronizing tables automatically
* Cascading updates or deletes
* Automatic timestamping of records

## Summary

Triggers are powerful tools to extend database functionality by automating actions in response to data changes. Use them thoughtfully to keep data consistent, enforce rules, and audit activity, but also be cautious of complexity and performance.

## Folder Structure Suggestion

```
mysql-triggers/
├── create_tables.sql     # Table definitions
├── audit_trigger.sql     # Example trigger script
├── README.md             # This guide
```
