'use strict'

require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');

require('./styles/main.scss');
require('./index.html');

var Elm = require('./Elm/Main.elm');
var mountNode = document.getElementById('main');
var app = Elm.Main.embed(mountNode);
