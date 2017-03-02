import React from 'react'

const UnavailableDisplay = props => {

  let itemDiv;

  let remove;
  if(props.item.lender_id === props.currentUser.id){
    remove = <span><form onSubmit={props.onDelete}><button type="submit">Delete This Item</button></form></span>
  }

  let update;
  if(props.item.lender_id === props.currentUser.id){
    update = <span><button><a href={`/items/${props.item.id}/edit`}>Update This Item</a></button></span>
  }

  let more = <span><button><a href={`/items/${props.item.id}/`}>Find out More</a></button></span>

  let itemShow = props => {
    if(props.selectedID === props.item.id) {
      itemDiv = <div className="col-lg-12 des-box">Description: {props.item.body}
                  <div> Size: {props.item.size}</div>
                    <div className="select">
                      {remove}
                      {update}
                      {more}
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


export default UnavailableDisplay;
