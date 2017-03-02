import React, { Component } from 'react';
import UnavailableDisplay from "./UnavailableDisplay";

class ItemUnavailable extends Component {
  constructor(props) {
    super(props);
    this.state = {
      items: [],
      selectedItemID: null,
      currentUser: null
    };
    this.handleItemClick = this.handleItemClick.bind(this)
    this.fetching = this.fetching.bind(this)
    this.handleItemDelete = this.handleItemDelete.bind(this)
  }

  handleItemClick(id) {
    let selectedID = id;
    if(id === this.state.selectedItemId){
      selectedID = null
    }
    this.setState({selectedItemID: selectedID})
  }

  handleItemDelete(itemID){
    fetch(`/api/v1/items/${itemID}`, {
      credentials: "include",
      method: "delete",
    })
    .then(response=>{
      this.fetching()
    })
  }

  fetching () {
    fetch('/api/v1/items', {
      credentials: "include",
    })
    .then(response => {
      if (response.ok) {
        return response;
      }
    })
    .then(response => response.json())
    .then(body => {
      let data = body.items;
      let user = body.user;
      this.setState({
        items: data,
        currentUser: user
      });
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
        items = this.state.items.map((item) => {
        let className='col-lg-4 pic';

        let selected;
          if (item.id === this.state.selectedItemID) {
            selected = true;
          }

        let onItemClick = () => {
          this.handleItemClick(item.id);
        }

        let onDelete = (event) => {
          event.preventDefault();
          this.handleItemDelete(item.id)
        }
        if (item.available === false) {
          return (
            <div key={item.id} className={className}>
                <a href="javascript:;" onClick={onItemClick}>
                  <h3>{item.name}</h3>
                  <img src={item.image}/></a>
                  <div className='item-content'>
                  < UnavailableDisplay
                    selectedID = {this.state.selectedItemID}
                    item = {item}
                    onDelete = {onDelete}
                    currentUser = {this.state.currentUser}
                    />
                </div>
            </div>
          );
        }
      });
    }

    return (
      <div>
        {items}
      </div>
    )
  }
}

export default ItemUnavailable;
