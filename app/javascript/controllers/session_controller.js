import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    console.log(this.inputTarget)
  }

  async change(evt) {
    const options = { headers: { 'Accept': "application/json" } }
    const response = await fetch(`/sessions/${evt.target.value}/slots`, options);
    const data = await response.json();
    const remainingSlots = document.querySelector(".remaining-slots")
      if (remainingSlots) {
        remainingSlots.parentNode.removeChild(remainingSlots)
      }
    const countTarget = document.querySelector(".slots")
    if (Math.max(data.slots, 0) === 0) {
      countTarget.style.backgroundColor = "#ffaeaeed";
      countTarget.style.color = "#960000";
    } else{
      countTarget.style.backgroundColor = "#F7FCF8";
      countTarget.style.color = "#65C367";
    }

    countTarget.insertAdjacentHTML("beforeend", `<span class="remaining-slots"> <i class="fas fa-user mr-2"></i> ${Math.max(data.slots, 0)} place(s) restante(s)</span>`)
  }
}
