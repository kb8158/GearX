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
    this.handleItemDelete = this.handleItemDelete.bind(this)
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
    fetch(`/api/v1/items/${itemID}/selected`, {
      credentials: "include",
      method: "post",
      headers: { 'Content-Type': 'application/json' },
      body: json
    })

    .then(response=>{
      this.fetching();
    })
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
      items = this.state.items.filter((item)=>{return item.name.toLowerCase().search(this.props.query.toLowerCase()) > -1; });
      items = items.map((item) => {
        let className='col-lg-4';
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

        let onDelete = (event) => {
          event.preventDefault();
          this.handleItemDelete(item.id)
        }
        return (
          <div key={item.id} className={className}>
              <a href="javascript:;" onClick={onItemClick}>
                <h3 className="text-center">{item.name}</h3>
                <img src={item.image}/></a>
                <div className='item-content'>
                < ItemDisplay
                  selectedID = {this.state.selectedItemID}
                  item = {item}
                  onSubmit = {onSubmit}
                  onDelete = {onDelete}
                  currentUser = {this.state.currentUser}
                  />
              </div>
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
