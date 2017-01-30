import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

$(function() {
  ReactDOM.render(
    <h1>Hi</h1>,
    document.getElementById('app')
  );
});

var slideIndex = 0;
carousel();
