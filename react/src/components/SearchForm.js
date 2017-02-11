import React from 'react';

const SearchForm = props => {
  let handleChange = (event) => props.handleSearch(event.target.value);

  let searchedItem = null;

  return(
    <div>
      <h1 className="text-center">Find your Gear: <input type="text" onChange={handleChange} placeholder="Search" /></h1>
      {searchedItem}
      </div>
    );
};

export default SearchForm;
