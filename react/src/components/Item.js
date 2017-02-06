import React, { Component } from 'react';
import Item from "./Item";

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      items: [],
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

        this.setState({ items: data });
      });
  }

  componentDidMount() {
    this.fetching();
    setInterval(
      this.fetching, 10000);
  }


  render() {
    let items = '';
    if (this.state.items) {
      items = this.state.items.filter((item)=>{return item.name.toLowerCase().search(this.props.query.toLowerCase()) > -1; });
      items = items.map((item) => {
        let className = 'col-lg-6';
        if (item == this.state.items[this.state.items.length - 1]) {
          className += ' end';
        }
      return (
        <div key={item.id}>
          <a href={`/items/${item.id}`}>
            <p>{item.name}</p>
            <img src={item.image}/>
          </a>
        </div>
      );
    });
  }

    return (
      <div>
        {items}
      </div>
    )
  }
}

export default App;
