import React from 'react'

const ItemDisplay = props => {

  let itemDiv;

  let select;
  if(props.item.lender_id !== props.currentUser.id){
    select = <form onSubmit={props.onSubmit}><button type="submit">Select This Item</button></form>
  }

  let remove;
  if(props.item.lender_id === props.currentUser.id){
    remove = <form onSubmit={props.onDelete}><button type="submit">Delete This Item</button></form>
  }

  let update;
  if(props.item.lender_id === props.currentUser.id){
    update = <a href={`/items/${props.item.id}/edit`}>Update This Item</a>
  }

  let itemShow = props => {

    if(props.selectedID === props.item.id) {
      itemDiv = <div className="item">{props.item.body}
                  <div>{props.item.size}</div>
                    {select}
                    {remove}
                    {update}
                  </div>
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