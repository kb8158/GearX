import React from 'react';

const Gear = (props) => {
  return(
    <div>
      <div>
        <div id="root">
        <h2><a href={'/elements/' + props.id}>{props.name}</a></h2>
        <img src={`${props.image}`}/>
        </div>
      </div>
    </div>
  )

}

export default Gear;
