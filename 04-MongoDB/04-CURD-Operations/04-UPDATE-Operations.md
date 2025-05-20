# MongoDB Update Operations

## Introduction

MongoDB provides flexible and powerful update operations to modify documents in a collection. You can update a single document, multiple documents, or perform atomic find-and-update operations. This section explains the update methods, their syntax, and practical examples using both MongoDB shell and Node.js.

## 1. Update Functions Overview

| Function                                    | Description                                                                                 |
| ------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `updateOne(filter, update, options)`        | Updates the first document matching the filter.                                             |
| `updateMany(filter, update, options)`       | Updates all documents matching the filter.                                                  |
| `findOneAndUpdate(filter, update, options)` | Atomically finds a document, updates it, and returns the document (before or after update). |

## 2. Syntax and Usage

### 2.1 `updateOne()`

Updates the first document that matches the filter criteria.

**Syntax:**

```js
db.collection.updateOne(
  filter,
  update,
  options
)
```

* `filter`: Query to match the document(s).
* `update`: Update operators such as `$set`, `$inc`, `$unset`.
* `options` (optional): `{ upsert: boolean }` — creates a new document if none match.

**Example (Shell):**

Update the `age` of the first document where `name` is "John Doe":

```shell
db.my_collection.updateOne(
  { name: "John Doe" },
  { $set: { age: 31 } }
)
```

### 2.2 `updateMany()`

Updates all documents matching the filter.

**Syntax:**

```js
db.collection.updateMany(
  filter,
  update,
  options
)
```

**Example (Shell):**

Increment `age` by 1 for all documents where `age` is less than 30:

```shell
db.my_collection.updateMany(
  { age: { $lt: 30 } },
  { $inc: { age: 1 } }
)
```

### 2.3 `findOneAndUpdate()`

Atomically finds a document and updates it, returning the original or updated document.

**Syntax:**

```js
db.collection.findOneAndUpdate(
  filter,
  update,
  options
)
```

* `options` can include:

  * `returnDocument`: `'before'` (default) or `'after'` — return document before or after update.
  * `upsert`: `true` or `false` — insert if no matching document found.

**Example (Shell):**

Update `age` and return the updated document:

```shell
db.my_collection.findOneAndUpdate(
  { name: "John Doe" },
  { $set: { age: 32 } },
  { returnDocument: "after" }
)
```

## 3. Node.js Code Examples

### 3.1 Setup

```js
const { MongoClient } = require('mongodb');
const uri = 'mongodb://localhost:27017/my_database';
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
```

### 3.2 Update One Document

```js
async function updateOneDocument() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.updateOne(
      { name: "John Doe" },
      { $set: { age: 31 } }
    );

    console.log('Matched count:', result.matchedCount);
    console.log('Modified count:', result.modifiedCount);
  } catch (error) {
    console.error('Error updating document:', error);
  } finally {
    await client.close();
  }
}
```

### 3.3 Update Multiple Documents

```js
async function updateManyDocuments() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.updateMany(
      { age: { $lt: 30 } },
      { $inc: { age: 1 } }
    );

    console.log('Matched count:', result.matchedCount);
    console.log('Modified count:', result.modifiedCount);
  } catch (error) {
    console.error('Error updating documents:', error);
  } finally {
    await client.close();
  }
}
```

### 3.4 Find One and Update

```js
async function findOneAndUpdateDocument() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.findOneAndUpdate(
      { name: 'John Doe' },
      { $set: { age: 32 } },
      { returnDocument: 'after' }
    );

    console.log('Updated document:', result.value);
  } catch (error) {
    console.error('Error in findOneAndUpdate:', error);
  } finally {
    await client.close();
  }
}
```

## 4. Notes

* Update operators like `$set`, `$inc`, `$unset` modify document fields.
* `upsert` option creates a new document if no match is found.
* `findOneAndUpdate()` allows retrieval of the document before or after the update.
* Always handle errors and close the connection after operations.
