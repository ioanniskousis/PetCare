import { calendarShow } from './calendar'

function pet_form_createEvents() {
 
  const dateOfBirthInput = document.getElementById("dateOfBirthInput");
  if (dateOfBirthInput) {
    dateOfBirthInput.onclick = function(e) {
      calendarShow(e.target, false);
    }  
  }
}

pet_form_createEvents();
