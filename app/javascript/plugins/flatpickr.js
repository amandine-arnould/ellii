import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

// https://flatpickr.js.org/localization/
const flatpickerInit = () => {
  
  flatpickr(".datepicker", { 
    "locale": French,
    altInput: true,
    altFormat: "j F, Y",
    minDate: "today",
    mode: "multiple",
    dateFormat: "Y-m-d"
  });
  flatpickr(".timepicker", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    defaultDate: "10:00",
    time_24hr: true,
  });
  flatpickr(".timepicker-end", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    defaultDate: "11:00",
    time_24hr: true,
  });
}  

export { flatpickerInit };
