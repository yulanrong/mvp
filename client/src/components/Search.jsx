import React from 'react';

const Search = ({handleChange, handleSearch}) => (
  <div className="search">
    <form>
      <input className="searchInput"
        type="text"
        name="search"
        placeholder=" Explore the syntax... Eg. CREATE TABLE"
        onChange={handleChange}
      /> <i class="fa fa-search" aria-hidden="true" id="searchIcon" style={{fontSize: "25px"}} onClick={handleSearch}></i>
    </form>
  </div>
);

export default Search;