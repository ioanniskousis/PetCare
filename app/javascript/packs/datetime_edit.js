function adjustDate() {
  const dateElement = document.getElementById("dateTimeInput");
  const value = parseInt(dateElement.getAttribute('dvalue'), 10) * 1000;
  
  const date = new Date(value);
  const shiftValue = date.valueOf() + (date.getTimezoneOffset() * 60 * 1000);

  dateElement.setAttribute('dvalue', (shiftValue / 1000).toString());
}

adjustDate();
