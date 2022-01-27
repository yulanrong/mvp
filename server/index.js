const express = require('express');
const path = require('path');
const model = require('./model.js');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.static('client/dist'));
app.use(express.json());

app.get('/data', model.getData);
app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`);
});
