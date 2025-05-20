# MongoDB CRUD Operations: Enhancing Query Results with Sorting and Limiting

## Introduction

Manipulating query results is a crucial aspect of MongoDB database management, enabling developers to retrieve data efficiently and effectively. In this comprehensive guide, we'll explore advanced techniques for modifying query results in MongoDB, focusing on **sorting** and **limiting** query results. By mastering these techniques, you'll be equipped to fine-tune your MongoDB queries and optimize data retrieval for your applications.

## 1. Sorting Query Results in MongoDB

Sorting query results allows you to arrange documents in ascending or descending order based on specified fields. This is particularly useful when you need ordered data, such as sorting users by age, products by price, or posts by date.

### 1.1 Syntax and Usage

You apply sorting on a cursor returned by `find()` using the `.sort()` method.

```js
db.collection.find(query).sort(sortCriteria)
```

* `query`: Filter to select documents (use `{}` for all).
* `sortCriteria`: An object specifying fields and their sort order.

  * Use `1` for ascending order.
  * Use `-1` for descending order.

**Example:** Sort documents by `age` in ascending order:

```js
db.my_collection.find({}).sort({ age: 1 })
```

### 1.2 Node.js Example: Sorting Query Results

```js
const { MongoClient } = require('mongodb');

const uri = 'mongodb://localhost:27017/my_database';
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

async function sortQueryResults() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');

    const database = client.db('my_database');
    const collection = database.collection('my_collection');

    // Sort documents in ascending order by 'age'
    const cursor = collection.find({}).sort({ age: 1 });

    await cursor.forEach(document => {
      console.log('Sorted document:', document);
    });
  } catch (error) {
    console.error('Error sorting query results:', error);
  } finally {
    await client.close();
    console.log('Disconnected from MongoDB');
  }
}

sortQueryResults();
```

## 2. Limiting Query Results in MongoDB

Limiting query results allows you to restrict the number of documents returned by a query. This is useful when you want to implement pagination or fetch only the top results.

### 2.1 Syntax and Usage

You apply a limit on a cursor using the `.limit()` method.

```js
db.collection.find(query).limit(number)
```

* `query`: Filter to select documents.
* `number`: The maximum number of documents to return.

**Example:** Retrieve only 5 documents:

```js
db.my_collection.find({}).limit(5)
```

### 2.2 Node.js Example: Limiting Query Results

```js
async function limitQueryResults() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');

    const database = client.db('my_database');
    const collection = database.collection('my_collection');

    // Limit the results to 5 documents
    const cursor = collection.find({}).limit(5);

    await cursor.forEach(document => {
      console.log('Limited document:', document);
    });
  } catch (error) {
    console.error('Error limiting query results:', error);
  } finally {
    await client.close();
    console.log('Disconnected from MongoDB');
  }
}

limitQueryResults();
```

## 3. Combining Sorting and Limiting

Often, you'll want to combine sorting and limiting to retrieve, for example, the top N documents ordered by a certain field.

```js
const cursor = collection.find({}).sort({ age: -1 }).limit(10);
```

This fetches the top 10 documents sorted by `age` in descending order.

## 4. Conclusion

In this guide, we've explored advanced techniques for modifying query results in MongoDB with a focus on **sorting** and **limiting**. Leveraging these methods helps optimize data retrieval and improve application performance, whether you're building web apps, analytics platforms, or data-driven APIs.

MongoDB's versatile query capabilities give you the flexibility and control needed to tailor data output precisely to your application's requirements. Embrace these techniques to unleash the full potential of MongoDB in your projects.
