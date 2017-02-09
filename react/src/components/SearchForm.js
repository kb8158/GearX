import React from 'react';

const SearchForm = props => {
  let handleChange = (event) => props.handleSearch(event.target.value);

  let searchedItem = null;

  return(
    <div>
      <h2 className="text-center">Find your Gear: <input type="text" onChange={handleChange} placeholder="Search" /><a href="/items/new">Or Add a New Item</a></h2>

      {searchedItem}
      </div>
    );
};

export default SearchForm;
