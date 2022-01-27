import React, { useState, useEffect } from 'react';
import axios from 'axios';
import MongoModal from './MongoModal.jsx';
import SqlModal from './SqlModal.jsx';
import Search from './Search.jsx';
import Mongo from './Mongo.jsx';
import Sql from './Sql.jsx';

const App = () => {
  const [content, setContent] = useState([]);
  const [hasSyntax, setSyntax] = useState(false);
  const [filteredContent, setFilteredContent] = useState([]);
  const [searchValue, setSearchValue] = useState('');

  useEffect(() => {
    axios.get('/data').then(
      (res) => {
        setContent(res.data);
      }
    ).catch((err) => {throw err;});
  }, []);

  const handleChange = (event) => {
    event.preventDefault();
    setSearchValue(event.target.value);
  };
  const handleSearch = (event) => {
    event.preventDefault();
    setSyntax(true);
    setFilteredContent(content.filter(
      (value) => (
        value.mongo_syntax.toLowerCase().includes(searchValue.toLowerCase())
      || value.sql_syntax.toLowerCase().includes(searchValue.toLowerCase())
      )
    ));
  }

  return (
    <div className="wrapper">
      <div className="title">
      <h1>Mongo SQL Playground</h1>
      <iframe src="https://giphy.com/embed/hlepzob42lUP1npEyG" width="150" height="84" frameBorder="0" class="giphy-embed"></iframe>
      <p className="subtitle">Have Fun with MongoDB and SQL syntax Here! <i class="fa fa-smile-o" aria-hidden="true"></i> </p>
      </div>
      <Search handleChange={handleChange} handleSearch={handleSearch} />

      <div className="mongo">
        <h4> Mongo Syntax</h4>
        >> {hasSyntax ? filteredContent.length === 0 ? <p> Sorry, there's no matching syntax. Please check back later. </p> : filteredContent.map((val) => (
          <Mongo content={val} />
        )) : null}
      </div>
      <div className="sql">
        <h4>SQL Syntax</h4>
        >> {hasSyntax ? filteredContent.length === 0 ? <p> Sorry, there's no matching syntax. Please check back later. </p> : filteredContent.map((val) => (
          <Sql content={val} />
        )) : null}
      </div>

      <div className="example">
      <p className="demo"> Don't know where to start? Check out the demo! <i class="fa fa-hand-o-down" aria-hidden="true"></i> </p>
      <MongoModal />
      <SqlModal />
      </div>

      <div className="footer"> Have questions? <i className="fa fa-hand-o-right" aria-hidden="true"></i><a href="https://github.com/yulanrong"> Contact</a></div>

      <div className="reference">
        Reference <i className="fa fa-external-link" aria-hidden="true"></i> <a href="https://docs.mongodb.com/manual/reference/sql-comparison/">MongoDB Documentation</a>
      </div>
    </div>
  );
}

export default App;
