import React, { Component } from 'react';
import Item from "./Item";
import SearchForm from './SearchForm';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      query: "",
    };
    this.handleSearch = this.handleSearch.bind(this);
  }

  handleSearch (query) {
    this.setState({query});
  }

  render(){
    return (
      <div>
      < SearchForm
        handleSearch={this.handleSearch}
      />
      < Item
        query={this.state.query}
      </div>
    )
  }
}

export default App;
