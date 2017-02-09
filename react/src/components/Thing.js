import React from 'react';

const Thing = props => {
  return(
    <div>
      <div>
      <h2><a href={'/things/' + props.id}>{props.name}</a></h2>
      </div>
    </div>
  )
}

export default Thing;
