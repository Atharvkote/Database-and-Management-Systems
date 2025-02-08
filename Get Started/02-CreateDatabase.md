# **Creating a Database in MySQL**  

## **For Ubuntu**  

> [!NOTE]  
> Ensure that you have the MySQL RDBMS software package installed on your local PC.  

### **Step 1: Access MySQL**  

1. Open the **Terminal**.  
2. Run the following command **to switch to the root user**:  

   ```bash
   sudo su
   ```  

3. Start the MySQL command-line interface:  

   ```bash
   mysql
   ```  

### **Step 2: Creating a Database**  

> [!NOTE]  
> Ensure that the terminal prompt has changed to **mysql**, indicating that you are now inside the MySQL shell.  

1. Now, start writing SQL queries to interact with MySQL RDBMS.  
2. To create a new database, run the following command:  

   ```sql
   CREATE DATABASE database_name;
   ```  

3. To verify whether the database is created, run the following command:  

   ```sql
   SHOW DATABASES;
   ```  


### **Example Use Case: Creating a Database in MySQL**  

#### **Step 1: Open the Terminal and Access MySQL**

1. Open the **Terminal** in Ubuntu.  
2. Switch to the **root user** (if not already root): 

   ```bash
   sudo su
   ```

   **Output:**

   ```plaintext
   [sudo] password for user:  
   root@your-PC:~#
   ```

3. Start the MySQL command-line interface: 

   ```bash
   mysql
   ```

   **Output:**  

   ```plaintext
   Welcome to the MySQL monitor.  Commands end with ; or \g.
   Your MySQL connection id is 10
   Server version: 8.0.36-0ubuntu0.22.04.1 (Ubuntu)

   Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

   mysql>
   ```


#### **Step 2: Create a Database**  

1. Run the following SQL command to create a database named `test_db`: 

   ```sql
   CREATE DATABASE test_db;
   ```

   **Output:** 

   ```plaintext
   Query OK, 1 row affected (0.01 sec)
   ```

2. Verify if the database has been created:

   ```sql
   SHOW DATABASES;
   ```

   **Output:** 

   ```plaintext
   +--------------------+
   | Database          |
   +--------------------+
   | information_schema |
   | mysql             |
   | performance_schema |
   | sys               |
   | test_db           |
   +--------------------+
   5 rows in set (0.00 sec)
   ```

At this point, **`test_db`** has been successfully created.
