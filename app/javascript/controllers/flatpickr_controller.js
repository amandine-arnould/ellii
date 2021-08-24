import flatpickr from "flatpickr";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    flatpickr(this.inputTarget, { enableTime: true, dateFormat: "d/m/Y h:iK" });
  }
}
