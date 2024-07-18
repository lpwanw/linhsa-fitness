import { Controller } from "@hotwired/stimulus"
import { Modal } from "flowbite"

// Connects to data-controller="modal"
export default class extends Controller {
  static values = {
    show: Boolean
  }

  connect() {
    this.modal = new Modal(this.element)
    if (this.showValue) {
      this.modal.show()
    }
  }

  disconnect() {
    this.modal.hide()
  }

  toggle() {
    this.modal.toggle()
  }

  show() {
    this.modal.show()
  }

  hide() {
    this.modal.hide()
  }
}
