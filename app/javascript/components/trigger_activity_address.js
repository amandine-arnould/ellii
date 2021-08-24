const triggerActivityAddress = () => {
  const checkboxes = document.querySelectorAll('.activity-location');
  checkboxes.forEach( (checkbox) => {
    checkbox.addEventListener('click', () => {
      const addressField = document.getElementById("address-field");
      const addressLabel = document.querySelector(".address-label");
      if (checkbox.value === "Présentiel") {
        addressField.classList.add('toggle-address-visibility');
        addressLabel.classList.add('toggle-address-visibility');
      }
      else {
        addressField.classList.remove('toggle-address-visibility');
        addressLabel.classList.remove('toggle-address-visibility');
      }
    })
  })
}

export { triggerActivityAddress }
