'use strict'

require('normalize.css/normalize.css');
require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');

require('./styles/main.scss');
require('./index.html');

var Elm = require('./Elm/Main.elm');
var mountNode = document.getElementById('app');
var app = Elm.Main.embed(mountNode);
