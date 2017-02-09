import 'babel-polyfill';
import 'whatwg-fetch';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import List from './components/List'


$(function() {
  if (document.getElementById('app')) {
  ReactDOM.render(
    <App />,
    document.getElementById('app')
    );
  }
// });
// $(function() {
  if (document.getElementById('root')) {
  ReactDOM.render(
    <List />,
    document.getElementById('root')
    );
  }
});
