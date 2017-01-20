'use strict'

require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');

require('./Styles/main.scss');
require('./index.html');
var drinkSvg = require('./drinkSvg');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');
var app = Elm.Main.embed(mountNode);

app.ports.display.subscribe(function(fractions) {
  drinkSvg.display(fractions);
});
