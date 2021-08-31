// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { twilioInit } from "../plugins/twilio.js";
import "controllers";
import { initMapbox } from "../plugins/init_mapbox";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initializeClock } from "../components/timer";
import { initSessionCable } from "../channels/session_channel";
import { chatScroll } from "../components/chat_scroll";
import "chartkick/chart.js"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { triggerActivityAddress } from "../components/trigger_activity_address";

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();
  triggerActivityAddress();
  initAutocomplete();
  initMapbox();
  initSessionCable();
  if (document.querySelector(".twilio-video")) {
    twilioInit();
  }
  if (document.querySelector("#countdown")) {
    initializeClock();
  }
  chatScroll();
});
