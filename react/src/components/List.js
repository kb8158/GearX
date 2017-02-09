import React, { Component } from 'react';
import Thing from "./Thing";

class List extends Component {
  constructor(props) {
    super(props);
    this.state = {
      thingData: [],
    };
    this.fetching = this.fetching.bind(this);
  }

  fetching () {
    fetch('/api/v1/things')
      .then(response => {
        if (response.ok) {
          return response;
        }
      })
      .then(response => response.json())
      .then(body => {
        let data = body;

        this.setState({ thingData: data });
      });
  }

  componentDidMount() {
    this.fetching();
    setInterval(
      this.fetching, 100000);
  }

  render(){

    let things;
    if (this.state.thingData) {
      things = this.state.thingData.map(thing => {
        return(
          <div>
            <Thing
              key={thing.id}
              id={thing.id}
              name={thing.name}
            />
          </div>
        )
      })
    }

    return (
      <div>
        {things}
      </div>
    )
  }
}

export default List;
