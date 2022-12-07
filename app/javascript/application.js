// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { initSwipeCards } from "./components/tinder"


const initCards = (card, index) => {
  var tinderContainer = document.querySelector('.tinder');
  var newCards = document.querySelectorAll('.tinder--card:not(.removed)');

  newCards.forEach(function (card, index) {
    card.style.zIndex = allCards.length - index;
    card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
    card.style.opacity = (10 - index) / 10;
  });

  tinderContainer.classList.add('loaded');
}

const animateOut = async (isLove) => {
  var cards = document.querySelectorAll('.tinder--card:not(.removed)');
  var moveOutWidth = document.body.clientWidth * 1.5;

  if (!cards.length) return false;

  var card = cards[0];

  card.classList.add('removed');

  if (isLove) {
    card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
  } else {
    card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
  }

  initSwipeCards()
  return "Finsihed animateCardSwipe"
}


document.addEventListener('turbo:before-fetch-request', async (event) => {
  var tinderTarget = document.querySelector('.tinder');
  if (tinderTarget) {
    console.log('awaiting: turbo:before-fetch-request')
    // window.isAnimating = true

    event.preventDefault()
    if (event.target.action && event.target.action.includes('love')) {
      const isLove = event.target.action.includes('love')
      const result = await animateOut(isLove)
    }


    // await waitFor(500);

    event.detail.resume()
    console.log('firing: turbo:before-fetch-request')
  }
})

document.addEventListener('turbo:frame-render', (event) => {
  console.log('turbo:frame-render')
  initSwipeCards()
})


document.addEventListener("turbo:load", () => {
  initSwipeCards()
})
