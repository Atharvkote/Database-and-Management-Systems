
# MongoDB Find & Find-And-Modify Operations

## Introduction

MongoDB offers powerful querying capabilities to retrieve documents using `find()` and `findOne()`, as well as atomic find-and-modify operations such as `findOneAndUpdate()`, `findOneAndDelete()`, and `findOneAndReplace()`. These methods enable flexible document retrieval and manipulation within a single operation, improving consistency and reducing race conditions.

This document covers:

* Basic querying with `find()` and `findOne()`
* Retrieving documents by `_id`
* Atomic find-and-modify operations
* Usage in MongoDB shell and Node.js

## 1. Basic Find Operations

### 1.1 `find()`

Returns a cursor for all documents matching the query criteria.

**Syntax:**

```js
db.collection.find(query, projection)
```

* `query` *(optional)*: Filter criteria to match documents. If omitted, returns all documents.
* `projection` *(optional)*: Specifies which fields to include (`1`) or exclude (`0`).

**Example (Shell):**

Find all documents where `age` is greater than 30, return only `name` and `age` fields:

```shell
db.my_collection.find({ age: { $gt: 30 } }, { name: 1, age: 1, _id: 0 })
```

### 1.2 `findOne()`

Returns the first document matching the query. Useful when you expect or want only one result.

**Syntax:**

```js
db.collection.findOne(query, projection)
```

**Example (Shell):**

Find one document where `name` is "Alice":

```shell
db.my_collection.findOne({ name: "Alice" })
```

### 1.3 Find Document by `_id`

Every MongoDB document has a unique `_id` field, typically an ObjectId.

**Syntax (Shell):**

```shell
db.my_collection.findOne({ _id: ObjectId("60a7b9f4a2e4c6d1c2d5b7a9") })
```

*Note:* Replace `"60a7b9f4a2e4c6d1c2d5b7a9"` with the actual ObjectId.

## 2. Find-and-Modify Operations (Atomic)

MongoDB provides these atomic operations that perform find and update/delete/replace in a single step, which is important for data integrity.

### 2.1 `findOneAndUpdate()`

Finds a single document and updates it atomically.

**Syntax:**

```js
db.collection.findOneAndUpdate(
  filter,
  update,
  options
)
```

* `filter`: Query to match the document.
* `update`: Update operations (e.g., `$set`, `$inc`).
* `options` *(optional)*:

  * `returnDocument`: `'before'` (default) or `'after'` — whether to return the document before or after update.
  * `upsert`: `true` or `false` — create a new document if none match.
  * Other options like `projection`, `sort`, etc.

**Example (Shell):**

Update `age` to 31 for the first document where `name` is "John Doe" and return the updated document:

```shell
db.my_collection.findOneAndUpdate(
  { name: "John Doe" },
  { $set: { age: 31 } },
  { returnDocument: "after" }
)
```

### 2.2 `findOneAndDelete()`

Atomically finds and deletes a document, returning the deleted document.

**Syntax:**

```js
db.collection.findOneAndDelete(
  filter,
  options
)
```

* `filter`: Query to match document.
* `options`: Optional projection, sort, etc.

**Example (Shell):**

Delete document where `name` is "John Doe" and return the deleted document:

```shell
db.my_collection.findOneAndDelete({ name: "John Doe" })
```

### 2.3 `findOneAndReplace()`

Atomically finds a document and replaces it entirely with a new document.

**Syntax:**

```js
db.collection.findOneAndReplace(
  filter,
  replacement,
  options
)
```

* `filter`: Query to match document.
* `replacement`: New document to replace the existing one.
* `options`: Same as above (returnDocument, upsert, etc.)

**Example (Shell):**

Replace the document where `name` is "John Doe" with a new document:

```shell
db.my_collection.findOneAndReplace(
  { name: "John Doe" },
  { name: "John Doe", age: 32, city: "New York" },
  { returnDocument: "after" }
)
```

## 3. Node.js Code Examples

### 3.1 Setup

```js
const { MongoClient, ObjectId } = require('mongodb');
const uri = 'mongodb://localhost:27017/my_database';
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
```

### 3.2 Find Multiple Documents

```js
async function findDocuments() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');
    
    const cursor = collection.find({ age: { $gt: 30 } });
    await cursor.forEach(doc => console.log('Found:', doc));
  } finally {
    await client.close();
  }
}
```

### 3.3 Find One Document by Query

```js
async function findOneDocument() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const document = await collection.findOne({ name: 'Alice' });
    console.log('Found document:', document);
  } finally {
    await client.close();
  }
}
```

### 3.4 Find Document by `_id`

```js
async function findById(id) {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const document = await collection.findOne({ _id: new ObjectId(id) });
    console.log('Found by _id:', document);
  } finally {
    await client.close();
  }
}
```

### 3.5 Find One and Update

```js
async function findOneAndUpdate() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.findOneAndUpdate(
      { name: 'John Doe' },
      { $set: { age: 31 } },
      { returnDocument: 'after' }  // Return the updated document
    );

    console.log('Updated document:', result.value);
  } finally {
    await client.close();
  }
}
```

### 3.6 Find One and Delete

```js
async function findOneAndDelete() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.findOneAndDelete({ name: 'John Doe' });
    console.log('Deleted document:', result.value);
  } finally {
    await client.close();
  }
}
```

### 3.7 Find One and Replace

```js
async function findOneAndReplace() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const replacementDoc = { name: 'John Doe', age: 32, city: 'New York' };

    const result = await collection.findOneAndReplace(
      { name: 'John Doe' },
      replacementDoc,
      { returnDocument: 'after' }
    );

    console.log('Replaced document:', result.value);
  } finally {
    await client.close();
  }
}
```

## Notes

* Always close the MongoDB client after operations to avoid resource leaks.
* Use `ObjectId` from the `mongodb` package to query by `_id`.
* `returnDocument` option controls if the returned document is before or after update/replace.
* Use upsert option in update and replace to create the document if it doesn’t exist.
