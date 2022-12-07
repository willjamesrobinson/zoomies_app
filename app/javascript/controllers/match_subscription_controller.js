import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { matchId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "MatchChannel", id: this.matchIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.matchIdValue}.`)
  }
    #insertMessageAndScrollDown(data) {
      console.log(data)
      const html = data.html
      const isSender = data.senderId === this.currentUserIdValue
      const position = isSender ? 'right' : 'left'
      let updatedHtml = html.replace( /(right|left)/, position);
      this.messagesTarget.insertAdjacentHTML("beforeend", updatedHtml)
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
  resetForm(event) {
    event.target.reset()
  }
  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
