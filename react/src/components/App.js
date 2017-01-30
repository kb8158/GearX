import React, { Component } from 'react';
import Shoe from "./Item";

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      itemData: [],
    };
    this.fetching = this.fetching.bind(this);
  }

  fetching () {
    fetch('/api/v1/items.json')
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
      shoes = this.state.itemData.map(item => {
        return(
          <div>
            <Shoe
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
      <h3 id="new-item-react"><a href={'/items/new'}>Add New Item</a></h3>
        {items}
      </div>
    )
  }
}

export default App;
