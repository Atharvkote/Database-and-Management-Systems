# MongoDB Delete Operations

## Introduction

MongoDB provides several methods to remove documents from collections. You can delete a single document, multiple documents, or atomically find-and-delete a document in one step. This guide explains how to use these delete operations effectively with syntax, options, and code examples in both the MongoDB shell and Node.js.

## 1. Delete Functions Overview

| Function                            | Description                                              |
| ----------------------------------- | -------------------------------------------------------- |
| `deleteOne(filter)`                 | Deletes a single document matching the filter.           |
| `deleteMany(filter)`                | Deletes all documents matching the filter.               |
| `findOneAndDelete(filter, options)` | Atomically finds and deletes one document, returning it. |

## 2. Syntax and Usage

### 2.1 `deleteOne()`

Deletes the first document that matches the specified filter.

**Syntax:**

```js
db.collection.deleteOne(filter)
```

* `filter`: Criteria to match documents to delete.

**Example (Shell):**

Delete one document where `name` is "John Doe":

```shell
db.my_collection.deleteOne({ name: "John Doe" })
```

### 2.2 `deleteMany()`

Deletes all documents that match the filter.

**Syntax:**

```js
db.collection.deleteMany(filter)
```

**Example (Shell):**

Delete all documents where `age` is less than 25:

```shell
db.my_collection.deleteMany({ age: { $lt: 25 } })
```

### 2.3 `findOneAndDelete()`

Atomically finds a single document and deletes it, returning the deleted document.

**Syntax:**

```js
db.collection.findOneAndDelete(filter, options)
```

* `filter`: Query to select the document.
* `options`: Optional projection, sort, etc.

**Example (Shell):**

Find and delete the document where `name` is "Alice", returning the deleted document:

```shell
db.my_collection.findOneAndDelete({ name: "Alice" })
```

## 3. Node.js Code Examples

### 3.1 Setup

```js
const { MongoClient } = require('mongodb');
const uri = 'mongodb://localhost:27017/my_database';
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
```

### 3.2 Delete One Document

```js
async function deleteOneDocument() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.deleteOne({ name: "John Doe" });
    console.log('Deleted count:', result.deletedCount);
  } catch (error) {
    console.error('Error deleting document:', error);
  } finally {
    await client.close();
  }
}
```

### 3.3 Delete Multiple Documents

```js
async function deleteManyDocuments() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.deleteMany({ age: { $lt: 25 } });
    console.log('Deleted count:', result.deletedCount);
  } catch (error) {
    console.error('Error deleting documents:', error);
  } finally {
    await client.close();
  }
}
```

### 3.4 Find One and Delete

```js
async function findOneAndDelete() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.findOneAndDelete({ name: "Alice" });
    console.log('Deleted document:', result.value);
  } catch (error) {
    console.error('Error in findOneAndDelete:', error);
  } finally {
    await client.close();
  }
}
```

## 4. Notes

* `deleteOne()` deletes only the first matching document.
* `deleteMany()` deletes all matching documents.
* `findOneAndDelete()` returns the deleted document, useful for confirmation.
* Always close the database connection to avoid resource leaks.
* Use filters carefully to avoid deleting unintended documents.

