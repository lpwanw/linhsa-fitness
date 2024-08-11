import { Controller } from "@hotwired/stimulus";
import EditorJS from "@editorjs/editorjs";

// Connects to data-controller="editorjs"
export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.editor = new EditorJS({
      placeholder: "Type something",
      data: this.getInitialContent(),
    });
  }

  saveData() {
    this.editor
      .save()
      .then((outputData) => {
        const data = JSON.stringify(outputData);
        this.contentTarget.value = data;
        console.log(data);
      })
      .catch((error) => {
        console.log("Saving failed: ", error);
      });
  }

  getInitialContent() {
    const hiddenContentField = this.contentTarget;
    if (hiddenContentField?.value) {
      return JSON.parse(hiddenContentField.value);
    }
    return {};
  }
}
