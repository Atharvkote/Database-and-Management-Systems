# DBMS - Database Management System

<div align="center" >

| MySQL | MongoDB |
|-------|---------|
|<img align="center"  src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/mysql.png" height="70" width="70" />|<img align="center" src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/mongodb.png" height="70" width="70" />|

 
</div>

## SQL - Structured Query Language
### **SQL Sublanguages and Their Purpose**

<div align="center" >
 <img src="/images/SubLanguage.png" height="400" width="400" />
</div>



SQL (Structured Query Language) is categorized into different sublanguages, each serving a specific role in database management. These sublanguages ensure efficient interaction with relational databases.



### **1. DDL (Data Definition Language) – Database Structure Management**  
DDL consists of commands that define, alter, and remove database structures such as tables, indexes, and views. These commands impact the schema of the database and are auto-committed, meaning changes are permanent.

- **CREATE** is used to create new database objects, such as tables, indexes, or views.
- **ALTER** modifies the structure of existing database objects, such as adding or deleting columns.
- **DROP** permanently removes database objects along with their data.
- **TRUNCATE** deletes all records from a table but retains the table’s structure for future use.



### **2. DML (Data Manipulation Language) – Managing Data Within Tables**  
DML is responsible for handling data stored in the database. Unlike DDL, these commands affect the records inside tables rather than the structure itself.

- **SELECT** retrieves data from one or more tables based on specific conditions.
- **INSERT** adds new records into a table.
- **UPDATE** modifies existing records in a table.
- **DELETE** removes specific records from a table without affecting its structure.



### **3. DCL (Data Control Language) – Managing Access and Security**  
DCL is used to define access control and manage user permissions in a database system. These commands ensure security and regulate who can access or modify data.

- **GRANT** provides specific privileges to users, such as the ability to read, write, or modify data.
- **REVOKE** removes previously granted privileges, restricting user access.



### **4. TCL (Transaction Control Language) – Handling Transactions**  
TCL ensures the consistency and integrity of transactions within a database. These commands help manage multiple SQL operations as a single unit.

- **COMMIT** saves all changes made in a transaction permanently.
- **ROLLBACK** undoes changes made in the current transaction before they are committed.
- **SAVEPOINT** creates checkpoints within a transaction, allowing partial rollbacks without affecting the entire transaction.



### **5. DQL (Data Query Language) – Retrieving Data**  
DQL is primarily focused on retrieving data from a database. Although the **SELECT** statement is technically part of DML, it is often treated as a separate sublanguage due to its significance in querying data.

- **SELECT** is used to fetch data from tables based on specified conditions, filters, or aggregations.



### **Conclusion**  
Each SQL sublanguage serves a distinct function in database management. **DDL** modifies the database structure, **DML** manages the data, **DCL** controls access, **TCL** ensures transaction integrity, and **DQL** retrieves data efficiently. Understanding these sublanguages is essential for effective database administration and application development.
