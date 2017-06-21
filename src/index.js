'use strict'

require('normalize.css/normalize.css');
require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');

require('./styles/main.scss');
require('./index.html');

var Elm = require('./Elm/Main.elm');
var mountNode = document.getElementById('app');

var host = process.env.NODE_ENV === 'production' ?
  'https://ryanpeaseisabitch.herokuapp.com' :
  'http://localhost:8080';

var app = Elm.Main.embed(mountNode, {
  apiHost: host,
});
