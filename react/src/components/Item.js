import React from 'react';

const Item = (props) => {
  return(
    <div>
      <div id="app" className="container" className="row" className="col-lg-6">
          <h2><a href={'/items/' + props.id}>{props.name}</a></h2>
          <p> {props.description}</p>
          <p> {props.size} </p>
          <p> {props.location} </p>
      </div>
    </div>
  )

}

export default Item
