import React, { Component } from 'react';

const Thing = props => {
  return(
    <div>
      <div id="root">
      <h2><a href={'/things/' + props.id}>{props.name}</a></h2>
      </div>
    </div>
  )
}

export default Thing;
