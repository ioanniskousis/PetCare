import { formatDate } from './calendar'

function adjustDate() {
  const dateElement = document.getElementById("dateTimeInput");
  const value = parseInt(dateElement.getAttribute('dvalue'), 10) * 1000;
  const dateFormated = formatDate(new Date(value), true);
  
  dateElement.value = dateFormated;
}

adjustDate();
