import React, { Component } from 'react';
import ItemDisplay from "./ItemDisplay";

class Item extends Component {
  constructor(props) {
    super(props);
    this.state = {
      items: [],
      selectedItemID: null,
      currentUser: null
    };
    this.handleItemClick = this.handleItemClick.bind(this)
    this.fetching = this.fetching.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleItemClick(id) {
    let selectedID = id;
    if(id === this.state.selectedItemId){
      selectedID = null
    }
    this.setState({selectedItemID: selectedID})
  }

  handleSubmit(itemID){
    let data = {
      borrower_id: this.state.currentUser,
      item_id: itemID
    }

    let json = JSON.stringify(data);
    fetch(`api/v1/items/${itemID}/selected`, {
      credentials: "same-origin",
      method: "post",
      headers: { 'Content-Type': 'application/json' },
      body: json
    })
    .then(response=>{
      this.fetching();
    })
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
        let data = body.items;
        let user = body.user;
        debugger
        this.setState({
          items: data,
          currentUser: user
        });
      });
  }

  componentDidMount() {
    this.fetching();
    setInterval(
      this.fetching, 100000);
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
        let selected;
          if (item.id === this.state.selectedItemID) {
            selected = true;
          }

        let onItemClick = () => {
          this.handleItemClick(item.id);
        }

        let onSubmit = (event) =>{
          event.preventDefault();
          this.handleSubmit(item.id)
        }

        return (
          <div key={item.id}>
            <a href="javascript:;" onClick={onItemClick}>
              <h3>{item.name}</h3></a>
              <img src={item.image}/>
              < ItemDisplay
                selectedID = {this.state.selectedItemID}
                item = {item}
                onSubmit = {onSubmit}
                />
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

export default Item;
