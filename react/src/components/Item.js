import React from 'react';
import { Button } from 'react-bootstrap';

const Item = (props) => {
  return(
    <div>
      <div id="app" className="col-md-4 box">
        <h4><a href={'/items/' + props.id}>{props.name}</a></h4>
        <img src={`${props.image}`}/>
      </div>
    </div>
  )

}

export default Item;
