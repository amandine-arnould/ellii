const triggerActivityAddress = () => {
  const checkboxes = document.querySelectorAll('.activity-location');
  checkboxes.forEach( (checkbox) => {
    checkbox.addEventListener('click', () => {
      const addressField = document.querySelector(".address-field");
      const addressLabel = document.querySelector(".address-label");
      const checkboxLabel = checkbox.nextSibling;

      if (checkboxLabel.innerHTML == "Présentiel") {
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
