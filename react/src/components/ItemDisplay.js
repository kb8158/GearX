import React from 'react'

const ItemDisplay = props => {

  let itemDiv;

  let itemShow = props => {

    if(props.selectedID === props.item.id) {
      itemDiv = <div className="item">{props.item.body}
                  <div>{props.item.size}</div>
                  <form onSubmit={props.onSubmit}><button type="submit">Select This Item</button></form></div>
      return itemDiv;
    }
  }
  return(
    <div className="contain">
      {itemShow(props)}
      </div>
  )
}


export default ItemDisplay;
