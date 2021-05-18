// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


/* select2 start block >>>*/
import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.css';

document.addEventListener("turbolinks:load", function() {
  $(".select2").select2({
    tags: true,
    tokenSeparators: [',', ' ']
  })
});
/* select2 end block <<<*/



Rails.start()
Turbolinks.start()
ActiveStorage.start()
