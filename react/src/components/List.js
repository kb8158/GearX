import React, { Component } from 'react';
import Thing from "./Thing";


class List extends Component {
  constructor(props) {
    super(props);
    this.state = {
      things: [],
    };
    this.fetching = this.fetching.bind(this);
  }

  fetching () {
    fetch('/api/v1/things', {
      credentials: "include",
    })
    .then(response => {
      if (response.ok) {
        return response;
      }
    })
    .then(response => response.json())
    .then(body => {
      debugger
      let data = body.things;
      this.setState({
        things: data,
      });
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
      things = this.state.things.map(thing => {
        return(
          <div>
            <Thing
              key={thing.id}
              id={thing.id}
              name={thing.name}
              description={thing.body}
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
