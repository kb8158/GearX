import React, { Component } from 'react';
import Gear from "./Gear";

class WishList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      gearData: [],
    };
    this.fetching = this.fetching.bind(this);
  }

  fetching () {
    fetch('/api/v1/elements')
      .then(response => {
        if (response.ok) {
          return response;
        }
      })
      .then(response => response.json())
      .then(body => {
        let data = body;

        this.setState({ gearData: data });
      });
  }

  componentDidMount() {
    this.fetching();
    setInterval(
      this.fetching, 100000);
  }

  render(){

    let gears;
    if (this.state.gearData) {
      gears = this.state.gearData.map(gear => {
        return(
          <div>
            <Gear
              key={gear.id}
              id={gear.id}
              name={gear.name}
              image={gear.image}
              description={gear.body}
            />
          </div>
        )
      })
    }

    return (
      <div>
        {gears}
      </div>
    )
  }
}

export default WishList;
