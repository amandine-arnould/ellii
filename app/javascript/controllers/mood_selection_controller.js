import Rails from "@rails/ujs";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["moodForm", "container", "partial"];

  connect() {
    console.log("Hello");
  }
  submitMood(event) {
    event.preventDefault();
    console.log(this.moodFormTarget);
    const formData = new FormData(this.moodFormTarget);

    Rails.ajax({
      url: this.moodFormTarget.action,
      type: "post",
      data: formData,
      success: function (data) {
        this._fadeOut(this.containerTarget);
        setTimeout(
          function () {
            this.containerTarget.outerHTML = data.partial;
            const partial = document.querySelector("#mood-selection-partial");
            partial.style.opacity = "0";
            setTimeout(
              function () {
                partial.style.transition = "all ease 1s";
                partial.style.opacity = "1";
              }.bind(partial),
              20
            );
          }.bind(this),
          1000
        );
      }.bind(this),
      error: function () {
        console.log("Error");
      },
    });
  }

  _fadeOut(element) {
    element.style.transition = "all ease 1s";
    element.style.opacity = "0";
  }
  _fadeIn(element) {
    element.style.transition = "all ease 1s";
    element.style.opacity = "1";
  }
}
