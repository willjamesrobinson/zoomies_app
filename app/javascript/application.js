// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { initSwipeCards } from "./components/tinder"

document.addEventListener("turbo:load", () => {
  const tinder = document.querySelector('.tinder');
  tinder && initSwipeCards(); // fancy if statement
})
