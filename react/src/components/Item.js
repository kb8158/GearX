import React from 'react';

const Item = (props) => {
  return(
    <div>
      <div>
        <div id="app">
        <h2><a href={'/items/' + props.id}>{props.name}</a></h2>
        <img src={`${props.image}`}/>
        </div>
      </div>
    </div>
  )

}

export default Image;
