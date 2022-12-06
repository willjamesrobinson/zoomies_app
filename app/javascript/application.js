// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { initSwipeCards } from "./components/tinder"

document.addEventListener("turbo:load", () => {
  const tinder = document.querySelector('.tinder');
  tinder && initSwipeCards(); // fancy if statement
})

// $(function() {
//   $("#dog-age").slider({
//     range: "max",
//     min: 0, // Change this to change the min value
//     max: 20, // Change this to change the max value
//     value: 10, // Change this to change the display value
//     step: 0.5, // Change this to change the increment by value.
//     slide: function(event, ui) {
//       $("#dogAge").val(ui.value + " years");
//     }
//   });
//   $("#dogAge").val($("#dog-age").slider("value") + " years");
// });
