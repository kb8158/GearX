import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';



$(function() {
  if (document.getElementById('app')) {
  ReactDOM.render(
    <App />,
    document.getElementById('app')
    );
  }
});

$(function() {
  if (document.getElementById('root')) {
  ReactDOM.render(
    <WishList/>,
    document.getElementById('root')
    );
  }
});
