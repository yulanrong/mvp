const db = require('./database');

module.exports = {
  getData: (req, res) => {
    const query = 'select * from mongosql';
    db.query(query, (err, results) => {
      if (err) {
        console.log('unable to get data ', err);
        res.sendStatus(500);
      } else {
        res.json(results);
      }
    });
  },
};