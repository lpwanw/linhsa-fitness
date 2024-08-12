import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="preview-video"
export default class extends Controller {
  static targets = ["input", "preview"];

  connect() {}

  setPreview(event) {
    const inputFile = event.target.files[0];
    this.previewTarget.src = window.URL.createObjectURL(inputFile);
  }
}
