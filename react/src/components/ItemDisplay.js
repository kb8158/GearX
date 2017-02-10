import React from 'react'

const ItemDisplay = props => {

  let itemDiv;

  let select;
  if(props.item.lender_id !== props.currentUser.id){
    select = <form onSubmit={props.onSubmit}><button type="submit">Select This Item</button></form>
  }

  let remove;
  if(props.item.lender_id === props.currentUser.id){
    remove = <span><form onSubmit={props.onDelete}><button type="submit">Delete This Item</button></form></span>
  }

  let update;
  if(props.item.lender_id === props.currentUser.id){
    update = <span><button><a href={`/items/${props.item.id}/edit`}>Update This Item</a></button></span>
  }

  let itemShow = props => {

    if(props.selectedID === props.item.id) {
      itemDiv = <div className="col-lg-12 des-box">Description: {props.item.body}
                  <div> Size: {props.item.size}</div>
                    <div className="select">
                      {select}
                      {remove}
                      {update}
                    </div>
                  </div>
      return itemDiv;
    }
  }
  return(
    <div>
      {itemShow(props)}
    </div>
  )
}


export default ItemDisplay;
