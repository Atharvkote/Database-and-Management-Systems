# Getting Started with MySQL

## Installation on Ubuntu

### Step 1: Update Package Index
Run the following command to update your package lists:
```css
sudo apt update
```

### Step 2: Install MySQL Server
To install MySQL, use:
```css
sudo apt install -y mysql-server
```
(The `-y` flag automatically confirms the installation.)

### Step 3: Secure the MySQL Installation
Run the security script to configure MySQL security settings:
```css
sudo mysql_secure_installation
```
During this process, you will:
- Set a root password (if not already set).
- Remove anonymous users.
- Disable remote root login (recommended for security).
- Remove the test database.

**Note:** In MySQL 8+, root authentication uses `auth_socket` by default, so logging in with a password might not work unless changed manually.

### Step 4: Verify MySQL is Running
Check the MySQL service status:
```css
sudo systemctl status mysql
```
To start MySQL if it is not running:
```css
sudo systemctl start mysql
```
To enable MySQL to start on boot:
```css
sudo systemctl enable mysql
```

---

## Installation on Windows

### Step 1: Download MySQL Installer
Download the **MySQL Installer** from the [official MySQL website](https://dev.mysql.com/downloads/installer/).

### Step 2: Run the Installer
- Open the **MySQL Installer** and follow the setup wizard.

### Step 3: Choose Setup Type
- For most users, **Developer Default** is recommended.
- Advanced users can select **Custom**.

### Step 4: Configure MySQL Server
- Set a **root password**.
- Optionally, create additional user accounts.

### Step 5: Start MySQL Server & Verify Installation
- Open **MySQL Command Line Client**.
- Enter the root password you set during installation.
- Run a test query:
    ```sql
    SHOW DATABASES;
    ```

### Step 6: (Optional) Add MySQL to System PATH
To use MySQL from the command prompt without specifying the full path:
1. Open **System Properties** (`Win + R`, type `sysdm.cpl`, and press Enter).
2. Go to the **Advanced** tab → Click **Environment Variables**.
3. Under **System Variables**, find and edit **Path**.
4. Click **New** and add:
    ```css
    C:\Program Files\MySQL\MySQL Server 8.0\bin
    ```
5. Click **OK** and restart your terminal.


## Troubleshooting Common Issues

### 1. **Cannot Log in as Root (Ubuntu)**
- Run MySQL with sudo:  
  ```css
  sudo mysql -u root
  ```
- If you need to set a root password manually:
  ```css
  sudo mysql
  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_password';
  FLUSH PRIVILEGES;
  EXIT;
  ```

### 2. **MySQL Service Not Starting (Ubuntu)**
Try restarting the service:
```css
sudo systemctl restart mysql
```
Check for error logs:
```css
sudo journalctl -u mysql --no-pager | tail -n 20
```

### 3. **MySQL Command Not Recognized (Windows)**
Ensure MySQL is added to the system PATH (Step 6).


## Uninstalling MySQL

### Ubuntu:
```css
sudo apt remove --purge mysql-server mysql-client mysql-common -y
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/mysql
```

### Windows:
- Open **Control Panel** → **Programs and Features** → Uninstall MySQL.
- Delete `C:\ProgramData\MySQL` if needed.
