import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-state"
export default class extends Controller {
  connect() {
  }

  setState(event) {
    const { key, value } = event.params

    console.log(this.element.setAttribute(this.dataKey(key), value))
  }

  dataKey(key) {
    return `data-${key}`
  }
}
