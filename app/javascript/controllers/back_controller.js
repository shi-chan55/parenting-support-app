import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { fallback: String }

  goBack(event) {
    event.preventDefault()
    const cameFromSameApp = document.referrer.startsWith(window.location.origin)
    if (cameFromSameApp) {
      window.history.back()
    } else {
      // 本来は dashboard が出発点だが、Week4時点では dashboard が
      // 機能画面として未整備のため、実際に機能している difficulties へ暫定的に誘導
      window.location.href = this.fallbackValue
    }
  }
}