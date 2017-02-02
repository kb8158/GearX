import React from 'react';

const SearcFrom = props => {
  let handleChange = (event) = props.handleSearch(event.target.value);

  let searchedItem = null;

  return)
    <div className='seach-box'>
      <h2>Find your Gear</h2>
      <input type="text" onChange={handleChange} placeholder="Search" />
      {searchedItem}
      </div>
    );
}

export default SearchForm;
