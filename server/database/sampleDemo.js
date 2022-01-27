const sampleDemo = [
  "schema using mongoDB",

  `  import mongoose from 'mongoose';

  const { Schema } = mongoose;

  const schema_name = new Schema({
    user_id: {
      type: Number,
      required: true, index: true
    },
    user: { type: String },
     items: [{
        name: { type: String },
        qty: {
          type: Number,
          required() { return this.qty >= 0;
          }
        },
      }]
  });`,

   "schema using Postgres",
    `     \\connect database;

      CREATE TABLE IF NOT EXISTS users (
        user_id INT NOT NULL PRIMARY KEY,
        user VARCHAR(100)
      );
      CREATE TABLE IF NOT EXISTS items (
        item_id INT NOT NULL PRIMARY KEY,
        user_id INT NOT NULL,
        name VARCHAR(20),
        qty INT,
        FOREIGN KEY(user_id)
        REFERENCES users(user_id)
      );
    `,
];

export default sampleDemo;