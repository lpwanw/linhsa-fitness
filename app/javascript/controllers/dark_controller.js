import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dark"
export default class extends Controller {
  static targets = ["darkIcon", "lightIcon"]

  connect() {
    console.log(this.darkIconTarget.classList)
    if (localStorage.getItem("color-theme") === "dark" || (!("color-theme" in localStorage) && window.matchMedia("(prefers-color-scheme: dark)").matches)) {
      this.lightIconTarget.classList.remove("hidden");
    } else {
      this.darkIconTarget.classList.remove("hidden");
    }
  }

  toggle() {
    this.darkIconTarget.classList.toggle("hidden");
    this.lightIconTarget.classList.toggle("hidden");
    if (localStorage.getItem("color-theme")) {
      if (localStorage.getItem("color-theme") === "light") {
        document.documentElement.classList.add("dark", "bg-gray-900");
        localStorage.setItem("color-theme", "dark");
      } else {
        document.documentElement.classList.remove("dark", "bg-gray-900");
        localStorage.setItem("color-theme", "light");
      }

      // if NOT set via local storage previously
    } else {
      if (document.documentElement.classList.contains("dark")) {
        document.documentElement.classList.remove("dark", "bg-gray-900");
        localStorage.setItem("color-theme", "light");
      } else {
        document.documentElement.classList.add("dark", "bg-gray-900");
        localStorage.setItem("color-theme", "dark");
      }
    }
  }
}
