import React, { Component } from 'react';
import Item from "./Item";

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      itemData: [],
    };
    this.fetching = this.fetching.bind(this);
  }

  fetching () {
    fetch('/api/v1/items')
      .then(response => {
        if (response.ok) {
          return response;
        }
      })
      .then(response => response.json())
      .then(body => {
        let data = body;

        this.setState({ itemData: data });
      });
  }

  componentDidMount() {
    this.fetching();
    setInterval(
      this.fetching, 10000);
  }

  render(){

    let items;
    if (this.state.itemData) {
      items = this.state.itemData.map(item => {
        return(
          <div>
            <Item
              key={item.id}
              id={item.id}
              name={item.name}
              image={item.image}
              description={item.body}
            />
          </div>
        )
      })
    }

    return (
      <div>
        {items}
      </div>
    )
  }
}

export default App;
