# MongoDB Insert Operations

## Introduction

MongoDB provides flexible and powerful methods to insert documents into collections. This guide explains the syntax and usage of insert operations including `insertOne()` and `insertMany()`. You will also find examples for executing these commands in the MongoDB shell (terminal) and equivalent Node.js code.

## Syntax

### Insert a Single Document

```js
db.collection.insertOne(document)
```

* `document`: The JSON object you want to insert.

### Insert Multiple Documents

```js
db.collection.insertMany([document1, document2, ...])
```

* An array of JSON objects to be inserted.

## Available Insert Functions

| Function       | Description                         |
| -------------- | ----------------------------------- |
| `insertOne()`  | Inserts a single document.          |
| `insertMany()` | Inserts multiple documents at once. |

## Examples Using MongoDB Shell (Terminal)

### Insert One Document

```shell
use my_database

db.my_collection.insertOne({ name: "John Doe", age: 30 })
```

### Insert Multiple Documents

```shell
use my_database

db.my_collection.insertMany([
  { name: "Alice", age: 25 },
  { name: "Bob", age: 35 }
])
```

## Node.js Code Example for Insert Operations

```js
const { MongoClient } = require('mongodb');

// MongoDB connection string
const uri = 'mongodb://localhost:27017/my_database';

// Create a new MongoClient
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

async function insertDocuments() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');

    // Access the database and collection
    const database = client.db('my_database');
    const collection = database.collection('my_collection');

    // Insert a single document
    const result = await collection.insertOne({ name: 'John Doe', age: 30 });
    console.log('Inserted document:', result.insertedId);

    // Insert multiple documents
    const documents = [
      { name: 'Alice', age: 25 },
      { name: 'Bob', age: 35 }
    ];
    const resultMany = await collection.insertMany(documents);
    console.log('Inserted documents:', resultMany.insertedIds);
  } catch (error) {
    console.error('Error inserting documents:', error);
  } finally {
    await client.close();
    console.log('Disconnected from MongoDB');
  }
}

insertDocuments();
```
