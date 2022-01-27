DROP DATABASE IF EXISTS mongosqldb;
CREATE DATABASE mongosqldb;

USE mongosqldb;
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS mongosql (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mongo_syntax VARCHAR(100),
  sql_syntax VARCHAR(100),
  mongo_note TEXT,
  sql_note TEXT,
  mongo_example TEXT,
  sql_example TEXT
);

INSERT INTO mongosql(mongo_syntax, sql_syntax, mongo_note, sql_note, mongo_example,sql_example)
VALUES
   ('db.createCollection(“tablename”) or use db.tablename.insertOne()',
   'CREATE TABLE tablename()',
   'Schema implicitly created on first insertOne() or insertMany() operation',
   'Schema Statement to create a table',
   'db.tablename.insertOne({ user_id: 1, user: “abc” })',
   'CREATE TABLE tablename ( user_id INT AUTO_INCREMENT PRIMARY KEY, user VARCHAR(20))'
   ),
   ('db.tablename.drop()',
   'DROP TABLE tablename',
   'Drop/Delete table',
   'Drop table, usually use DROP TABLE IF EXISTS tablename to make sure the table exists',
   'db.tablename.drop()',
   'DROP TABLE tablename;'
   ),
   ('db.tablename.insertOne() or use db.tablename.insertMany()',
   'INSERT INTO tablename (columns) VALUES (“contents”)',
   'insertOne can add one new content to the database. To insert multiple contents, use db.tablename.insertMany()',
   'INSERT INTO can handle more than one new content',
   'db.tablename.insertOne({ user_id: 1, user: “abc”});  or db.tablename.insertMany([ {user_id: 1, user: “abc”}, {user_id: 2, user: “def”}, { user_id: 3, user: “ghi”} ]);',
   'INSERT INTO tablename (user) VALUES (“abc”), (“def”), (“ghi”);'
   );


-- mysql -u root < server/database/schema.sql