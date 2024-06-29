import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["target"]

  static values = {
    active: Boolean,
    enterClass: String,
    leaveClass: String,
    type: { type: String, default: "hover"}
  }

  connect() {
    if (this.typeValue === "hover") {
      this.element.addEventListener("mouseenter", () => {
        this.activeValue = true;
        this.targetTarget.classList.remove(...this.leaveClassValue.split(" "))
        this.targetTarget.classList.add(...this.enterClassValue.split(" "))
      })
      this.element.addEventListener("mouseleave", () => {
        this.activeValue = false;
        this.targetTarget.classList.remove(...this.enterClassValue.split(" "))
        this.targetTarget.classList.add(...this.leaveClassValue.split(" "))
      })
    }
  }
}
