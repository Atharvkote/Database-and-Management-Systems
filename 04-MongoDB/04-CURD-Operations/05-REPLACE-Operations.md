# MongoDB Replace Operations

## Introduction

Sometimes you need to completely replace an existing document with a new one, instead of just updating specific fields. MongoDB provides the `replaceOne()` method to replace a single document that matches a filter with a new document.

## 1. Replace Function Overview

| Function                                   | Description                                                         |
| ------------------------------------------ | ------------------------------------------------------------------- |
| `replaceOne(filter, replacement, options)` | Replaces a single document matching the filter with a new document. |

## 2. Syntax and Usage

### 2.1 `replaceOne()`

**Syntax:**

```js
db.collection.replaceOne(
  filter,
  replacement,
  options
)
```

* `filter`: Query to select the document to replace.
* `replacement`: The new document that will replace the matched document entirely.
* `options` (optional): `{ upsert: boolean }` — if true, inserts the replacement document if no match is found.

**Important:**
The replacement document **cannot contain update operators** like `$set`. It must be a full document.

### 2.2 Example in MongoDB Shell

Replace a document where `name` is "John Doe" with a completely new document:

```shell
db.my_collection.replaceOne(
  { name: "John Doe" },
  { name: "John Doe", age: 40, city: "New York" }
)
```

## 3. Node.js Example

### Setup

```js
const { MongoClient } = require('mongodb');
const uri = 'mongodb://localhost:27017/my_database';
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
```

### Replace a Document

```js
async function replaceDocument() {
  try {
    await client.connect();
    const collection = client.db('my_database').collection('my_collection');

    const result = await collection.replaceOne(
      { name: "John Doe" },
      { name: "John Doe", age: 40, city: "New York" },
      { upsert: false } // Optional: set to true to insert if no match found
    );

    console.log('Matched count:', result.matchedCount);
    console.log('Modified count:', result.modifiedCount);
  } catch (error) {
    console.error('Error replacing document:', error);
  } finally {
    await client.close();
  }
}
```

## 4. Notes

* `replaceOne()` replaces the **entire document**, not just fields.
* The replacement document must include all required fields.
* If `upsert` is set to `true`, and no documents match the filter, MongoDB inserts the replacement document.
* Use `replaceOne()` when you want to overwrite a document completely.

