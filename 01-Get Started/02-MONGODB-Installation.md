
# Getting Started with MongoDB  

## Installation on Ubuntu  

### Step 1: Import the MongoDB GPG Key  

MongoDB requires a GPG key for package authentication. Add it using:  

```bash
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo tee /usr/share/keyrings/mongodb-server-key.gpg >/dev/null
```  

### Step 2: Add the MongoDB Repository  

```bash
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-key.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
```  

### Step 3: Update Package List  

```bash
sudo apt update
```  

### Step 4: Install MongoDB  

```bash
sudo apt install -y mongodb-org
```  

### Step 5: Start and Enable MongoDB Service  

```bash
sudo systemctl start mongod
sudo systemctl enable mongod
```  

### Step 6: Verify MongoDB is Running  

Check the service status:  

```bash
sudo systemctl status mongod
```  

To connect to the MongoDB shell:  

```bash
mongosh
```  

## Installation on Windows  

### Step 1: Download MongoDB  

Download the **MongoDB MSI Installer** from the [official MongoDB website](https://www.mongodb.com/try/download/community).  

### Step 2: Run the Installer  

- Select **Complete Installation** (recommended for most users).  
- Ensure that **MongoDB Database Server** and **MongoDB Shell (mongosh)** are checked.  

### Step 3: Configure MongoDB as a Windows Service  

- Choose **Run MongoDB as a service** (recommended).  
- Select **"Local" or "Network Service" user** (default).  

### Step 4: Verify Installation  

Open **Command Prompt** and run:  

```bash
mongosh
```  

If it connects successfully, MongoDB is installed.  

### Step 5: (Optional) Add MongoDB to System PATH  

1. Open **System Properties** (`Win + R`, type `sysdm.cpl`, and press Enter).  
2. Go to the **Advanced** tab → Click **Environment Variables**.  
3. Under **System Variables**, find and edit **Path**.  
4. Click **New** and add:  

   ```
   C:\Program Files\MongoDB\Server\6.0\bin
   ```

5. Click **OK** and restart your terminal.  

## Troubleshooting Common Issues  

### 1. **MongoDB Service Not Starting (Ubuntu)**  

Try restarting the service:  

```bash
sudo systemctl restart mongod
```  

Check logs for errors:  

```bash
sudo journalctl -u mongod --no-pager | tail -n 20
```  

### 2. **MongoDB Command Not Found (Windows)**  

Ensure MongoDB is added to the system PATH (Step 5).  

### 3. **Cannot Connect to MongoDB**  

- Ensure MongoDB is running:  

  ```bash
  sudo systemctl status mongod   # Ubuntu
  ```

  ```bash
  net start MongoDB   # Windows
  ```  

- Check if the port (default: **27017**) is open:  

  ```bash
  netstat -tulnp | grep 27017   # Ubuntu
  ```

---

## Uninstalling MongoDB  

### Ubuntu  

```bash
sudo systemctl stop mongod
sudo apt remove --purge mongodb-org -y
sudo rm -rf /var/lib/mongo
sudo rm -rf /etc/mongod.conf
```  

### Windows  

- Open **Control Panel** → **Programs and Features** → Uninstall MongoDB.  
- Delete `C:\Program Files\MongoDB` if needed.  

