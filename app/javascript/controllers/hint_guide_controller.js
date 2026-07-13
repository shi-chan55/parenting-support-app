import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]
  static values = { hint: String, guide: String }

  showHint(event) {
    event.preventDefault()
    this.toggle(this.hintValue)
  }

  showGuide(event) {
    event.preventDefault()
    this.toggle(this.guideValue)
  }

  toggle(text) {
    const isSameContentAlreadyShown =
      !this.contentTarget.classList.contains("hidden") && this.contentTarget.textContent === text

    if (isSameContentAlreadyShown) {
      this.contentTarget.classList.add("hidden")
    } else {
      this.contentTarget.textContent = text
      this.contentTarget.classList.remove("hidden")
    }
  }
}