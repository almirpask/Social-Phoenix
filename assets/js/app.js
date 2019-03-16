// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import 'materialize-css/dist/js/materialize.min.js' 
import 'materialize-css/dist/css/materialize.min.css' 

import css from "../css/app.scss"


// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// M.AutoInit();
let dropDownElem = document.getElementById('dropdown-button');
let dropDownInstances = M.Dropdown.init(dropDownElem, {});

var sideNavElem = document.getElementById('side-bar');
var sideNavInstances = M.Sidenav.init(sideNavElem, {});






