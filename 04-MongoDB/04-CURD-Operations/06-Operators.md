# Commonly Used MongoDB Update Operators and Their Usage

MongoDB provides powerful update operators to modify documents efficiently. Here are the most frequently used ones you should know:

## 1. `$set`

**Purpose:**
Update the value of a field or add the field if it doesn’t exist.

**Example:**

```js
await collection.updateOne(
  { _id: someId },
  { $set: { name: 'Alice', age: 28 } }
);
```

* Changes or adds the fields `name` and `age`.

## 2. `$push`

**Purpose:**
Append a value to an array field (creates the array if it doesn’t exist).

**Example:**

```js
await collection.updateOne(
  { _id: someId },
  { $push: { hobbies: 'reading' } }
);
```

* Adds `"reading"` to the `hobbies` array.

## 3. `$inc`

**Purpose:**
Increment or decrement a numeric field.

**Example:**

```js
await collection.updateOne(
  { _id: someId },
  { $inc: { score: 5 } }
);
```

* Increases the `score` field by 5.

## 4. `$unset`

**Purpose:**
Remove a field from a document.

**Example:**

```js
await collection.updateOne(
  { _id: someId },
  { $unset: { obsoleteField: "" } }
);
```

* Deletes the field `obsoleteField` from the document.

## Summary Table

| Operator | Purpose                      | Example Usage                    |
| -------- | ---------------------------- | -------------------------------- |
| `$set`   | Update/add field(s)          | `{ $set: { age: 30 } }`          |
| `$push`  | Add element to array         | `{ $push: { tags: 'mongodb' } }` |
| `$inc`   | Increment/decrement a number | `{ $inc: { count: 1 } }`         |
| `$unset` | Remove a field               | `{ $unset: { tempField: "" } }`  |
