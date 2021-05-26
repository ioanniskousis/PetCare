import { calendarShow } from './calendar'

function datetime_form_createEvents() {
 
  const dateTimeInput = document.getElementById("dateTimeInput");
  if (dateTimeInput) {
    dateTimeInput.onclick = function(e) {
      calendarShow(e.target, true);
    }  
  }
}

datetime_form_createEvents();
