import React from 'react';

const SearchForm = props => {
  let handleChange = (event) => props.handleSearch(event.target.value);

  let searchedItem = null;

  return(
    <div>
      <h2 className="text-center">Find your Gear: <input type="text" onChange={handleChange} placeholder="Search" /></h2>
      <h2 className="text-center"><a href="/items/new">Add Gear to Lend</a></h2> 
      {searchedItem}
      </div>
    );
};

export default SearchForm;
