import { Controller } from "@hotwired/stimulus";
import { Drawer } from "flowbite";

// Connects to data-controller="drawer"
export default class extends Controller {
  connect() {
    this.toggleButton = document.getElementById(`${this.element.id}-toggle`);
    const options = {
      placement: "left",
      backdrop: true,
      bodyScrolling: false,
      edge: false,
      edgeOffset: "",
      backdropClasses: "bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-30",
    };
    this.drawer = new Drawer(this.element, options);
    this.drawer.hide();
    this.toggleButton.addEventListener("click", () => {
      this.toggle();
    });
  }

  toggle() {
    this.drawer.toggle();
  }
}
