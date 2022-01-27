const mysql = require('mysql2');

const dbConnection = mysql.createConnection( {
  user: 'root',
  password: '',
  database: 'mongosqldb',
});

dbConnection.connect((err) => {
  if (err) {
    throw err;
  } else {
    console.log('connected');
  }
});

module.exports = dbConnection;