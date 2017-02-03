import React from 'react';


const Item = (props) => {
  constructor(props) {
    super(props);
    this.state = {
      items: null
    };

    this.componentDidMount = this.componentDidMount.bind(this);
    this.getItems = this.getItems.bind(this);
  }

  componentDidMount() {
    this.fetching();
    setInterval(
      this.fetching, 100000);
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

      render() {
      let items = '';
      if (this.state.items) {
        items = this.state.items.filter((item)=>{return item.title.toLowerCase().search(this.props.query.toLowerCase()) > -1; });
        items = items.map((item) => {
          if (item == this.state.items[this.state.items.length - 1]) {
            className += ' end';
          }
          return (
            <div id="app" key={item.id} className={className}>
              <h4><a href={'/items/' + props.id}>{props.name}</a></h4>
                <div className='list-item-content'>
                  <p><b>{item.name}</b></p>
                  <div>
                    <img src={`${props.image}`}/>
                  </div>
                </div>
              </a>
            </div>
          );
        });
      }

      return(
        <div>
          {items}
        </div>
      );
    }
  }

export default Item;
