DROP DATABASE IF EXISTS mongosqldb;
CREATE DATABASE mongosqldb;

USE mongosqldb;
DROP TABLE IF EXISTS mongosql;

CREATE TABLE mongosql (
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
   ),
   ('db.tablename.find()',
   'SELECT * FROM tablename',
   'Find all data in the table',
   'Select all data from table',
   'db.tablename.find({ });',
   'SELECT * FROM tablename;'
   ),
   (
     'db.tablename.updateMany({ }, { $set: { columnname: TYPE } })',
     'ALTER TABLE tablename ADD columnname TYPE',
     'updateMany( ) operations can add fields to existing documents using $set operator',
     'Add/Update new column to the existing table',
     'db.tablename.updateMany( { }, { $set: { created_at: new Date( ) } } )',
     'ALTER TABLE tablename ADD created_at DATETIME;'
   ),
   (
     'db.tablename.updateMany({ }, { $unset: { “columnname”: “” } })',
     'ALTER TABLE tablename DROP COLUMN columnname',
     'To remove fields from documents, we can use updateMany( ) with $unset',
     'Delete column from a table',
     'db.tablename.updateMany({ }, { $unset: { “created_at”: “” } })',
     'ALTER TABLE tablename DROP COLUMN created_at;'
   ),
   (
     'db.tablename.createIndex( { column: 1} )',
     'CREATE INDEX indexname ON tablename(column)',
     'Create index for the column in table',
     'Create index can be efficient for data retrieval, but it also slows down the update and insert on the other hand.',
     'db.tablename.createIndex( {user_id: 1} );',
     'CREATE INDEX user_id_idx ON tablename(user_id);'
   ),
   (
     'db.tablename.createIndex( { column: 1, condition_column: -1 } )',
     'CREATE INDEX indexname_order_by ON tablename(column, condition_column DESC)',
     'Create index for the column and ordered by another column in descending order in table',
     '-1 in Mongo and DESC in sql means order by descending order, and 1 or ASC(optional) means ascending order',
     'db.tablename.createIndex( { user_id: 1, grades: -1 } );',
     'CREATE INDEX user_id_idx_grade_desc ON tablename (user_id, grades DESC);'
   ),
   (
     'db.tablename.find({ }, { col1: 1, col2: 1, _id: 0 })',
     'SELECT col1, col2 FROM tablename',
     '_id is the built-in default id in mongoDB, to not include it in finding data, we can set it to 0.',
     'Select the specific columns in table',
     'db.tablename.find( { }, { user_id: 1, grades: 1, _id: 0} );',
     'SELECT user_id, grades FROM tablename;'
   ),
   (
     'db.tablename.find({ condition_col: condition })',
     'SELECT * FROM tablename WHERE condition_col = condition',
     'Find all data in the table that satisfy the condition',
     'Select all data in the table that satisfy the condition',
     'db.tablename.find( { grades: 90 } );',
     'SELECT * FROM tablename WHERE grades = 90;'
   ),
   (
     'db.tablename.find({ condition_col: condition }, { col1: 1, _id: 0 })',
     'SELECT col1 FROM tablename WHERE condition_col = condition',
     'find the specific column data that satisfy the condition',
     'Select the specific column that all rows are filtered by the condition',
     'db.tablename.find( { grades: 90 }, { user_id: 1, _id: 0 } );',
     'SELECT user_id FROM tablename WHERE grades = 90;'
   ),
   (
     'db.tablename.find({ col: { $ne: condition } })',
     'SELECT * FROM tablename WHERE col != condition',
     'Find data that is not  equal to the condition',
     'Select all rows that are not equal to the condition',
     'db.tablename.find( { grades: { $ne: 90 } } );',
     'SELECT * FROM tablename WHERE grades != 90;'
   ),
   (
     'db.tablename.deleteMany({ })',
     'DELETE FROM tablename',
     'Delete the records from table, if need to delete records by condition, can specify condition inside { }. Eg. { col: condition }',
     'Delete the rows in table, if need to delete rows by condition, can use WHERE clause to specify a condition',
     'db.tablename.deleteMany({ grades: 90 });',
     'DELETE FROM tablename WHERE grades = 90;'
   ),
   (
     'db.tablename.updateMany({ $set: { col: new_content } })',
     'UPDATE tablename SET col = new_content',
     'Update the existing records in table, without specifying the condition, then the entire column will be updated with the same new content',
     'Update the rows in table, without specifying the condition, then the entire column will be updated with the same new content, can use WHERE clause to specify the condition',
     'db.tablename.updateMany( { user_id: { $lt: 30 } }, { $set: { grades: 100 } } );  this example update the grades to be 100 for user_id less than 30.',
     'UPDATE tablename SET grades = 100 WHERE user_id < 30;'
   ),
   (
     'db.tablename.find({ }).explain( )',
     'EXPLAIN SELECT * FROM tablename',
     'Analyze the query',
     'Analyze the query with b-tree',
     'db.tablename.find({ grades: 90 }).explain( )',
     'EXPLAIN SELECT * FROM tablename WHERE grades = 90;'
   ),
   (
     'db.tablename.find({ col1: condition1, col2: condition2 })',
     'SELECT * FROM tablename WHERE col1 = condition1 AND col2 = condition2',
     'Filter the data',
     'Filter data using AND ',
     'db.tablename.find( user_id: 5, grades: 90 });',
     'SELECT * FROM tablename WHERE user_id = 5 AND grades = 90;'
   ),
   (
     'db.tablename.find({ $or: [{ col1: condition1 }, { col2: condition2 }] })',
     'SELECT * FROM tablename WHERE col1 = condition1 OR col2 = condition2',
     'Filter data using $or operator',
     'Filter data using OR',
     'db.tablename.find({ $or: [ { user_id: 5 }, { grades: 90 } ] })',
     'SELECT * FROM tablename WHERE user_id = 5 OR grades = 90;'
   ),
   (
     'db.tablename.find({ col: { $gt: number_condition } })',
     'SELECT * FROM tablename WHERE col > number_condition',
     'Use $gt operator to filter data that greater than the condition',
     'filter data that greater than the condition',
     'db.tablename.find({ grades: { $gt: 90 } })',
     'SELECT * FROM tablename WHERE grades > 90;'
   ),
   (
     'db.tablename.find({ col: { $lt: number_condition } })',
     'SELECT * FROM tablename WHERE col < number_condition',
     'Use $lt operator to filter data that less than the condition, if want to filter less than or equal to, we can use $lte',
     'filter data that less than the condition. If want to filter less than or equal to, we can use <=',
     'db.tablename.find({ grades: { $lt: 90 } })',
     'SELECT * FROM tablename WHERE grades < 90;'
   ),
   (
     'db.tablename.find({ col: /regex/ }) or db.tablename.find({ col: { $regex: /regex/ }})',
     'SELECT * FROM tablename WHERE col like “regex”;',
     'Filter the data by regular expression, $regex operator can be omitted ',
     'Filter data by regular expression using LIKE ',
     'db.tablename.find({ user: /hello/ })',
     'SELECT * FROM tablename WHERE user LIKE “%hello%”;'
   ),
   (
     'db.tablename.find({ }).sort({ col: 1})',
     'SELECT * FROM tablename ORDER BY col ASC',
     'Order/sort the data by column in ascending order. If want to sort by descending order, can set col: -1',
     'Order/sort the data by column in ascending order. If want to sort by descending order, can replace ASC to DESC',
     'db.tablename.find({ }).sort({ grades: 1})',
     'SELECT * FROM tablename ORDER BY grades;'
   ),
   (
     'db.tablename.find( ).limit(n)',
     'SELECT * FROM table name LIMIT n;',
     'Only display the first n records',
     'Only select the first n rows',
     'db.tablename.find( ).limit(5)',
     'SELECT * FROM tablename LIMIT 5;'
   ),
   (
     'db.tablename.aggregate([{ $group: { _id: null, count: { $sum: 1 }}}])',
     'SELECT COUNT(*) AS count FROM tablename',
     'Count all records in table',
     'Count ',
     '',
     ''
   ),
   (
     'db.tablename.aggregate([{ $group: {_id: null, total: { $sum: “column name” }}}])',
     'SELECT SUM(columnname) AS total FROM tablename',
     'Sum up the values of a specific column',
     'Sum up the values of a specific column',
     '',
     ''
   );


-- mysql -u root < server/database/schema.sql