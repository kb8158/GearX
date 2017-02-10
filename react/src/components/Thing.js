import React from 'react';

const Thing = props => {

  let thingDiv;

  let select;
  if(props.thing.searcher_id !== props.currentUser.id){
    select = <form onSubmit={props.onSubmit}><button type="submit">Fulfil This Wish</button></form>
  }

  let remove;
  if(props.thing.searcher_id === props.currentUser.id){
    remove = <span><form onSubmit={props.onDelete}><button type="submit">Delete This Item</button></form></span>
  }

  let update;
  if(props.thing.searcher_id === props.currentUser.id){
    update = <span><button><a href={`/things/${props.thing.id}/edit`}>Update This Query</a></button></span>
  }

  let thingShow = props => {
    if(props.selectedID === props.thing.id){
      thingDiv = <div className="col-lg-12 thing"> Needed by: {props.thing.date}
                    <div> Duration: {props.thing.days}</div>
                    <div> Description: {props.thing.body} </div>
                    <div className="select">
                      {select}
                      {remove}
                      {update}
                    </div>
                  </div>
      return thingDiv
    }
  }
  return(
    <div>
      {thingShow(props)}
    </div>
  )
}

export default Thing;
