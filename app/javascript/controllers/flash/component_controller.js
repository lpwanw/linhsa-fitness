import { Controller } from "@hotwired/stimulus"
import { Dismiss } from "flowbite";

// Connects to data-controller="flash--component"
export default class extends Controller {
  static targets = ["trigger"]

  connect() {
    const options = {
      transition: 'transition-opacity',
      duration: 500,
      timing: 'ease-out',
    };

    this.dismiss = new Dismiss(this.element, this.triggerTarget, options);

    setTimeout(() => {
      this.dismiss.hide();
    }, 5000)
  }
}
