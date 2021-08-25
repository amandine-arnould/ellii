const moodSmiley = () => {
  const moodLabels = document.querySelectorAll('.collection_radio_buttons');
  const smileys = ['<i id="frown" class="far fa-frown"></i>',
  '<i id="meh" class="far fa-meh"></i>',
  '<i id="smile" class="far fa-smile"></i>',
  '<i id="smile-beam" class="far fa-smile-beam"></i>',
  '<i id="laugh-beam" class="far fa-laugh-beam"></i>'];
  moodLabels.forEach((label) => {
    label.innerHTML = smileys[parseInt(label.innerText, 10) - 1];
  })
};

export { moodSmiley }
