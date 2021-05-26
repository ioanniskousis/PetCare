import { rect_contains } from './utils'
import { last_month_day, nextDateValue } from './date_utils'

const monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

function calendarLayout(dateElement, includeTime) {
  const datetime_selector_bg = document.getElementById('datetime_selector_bg');
  datetime_selector_bg.onmousedown = function(e) {
    const p = { x: e.clientX, y: e.clientY};
    const calendarContainer = document.getElementById('calendarContainer');
    const rect = calendarContainer.getBoundingClientRect();
    if (!rect_contains(rect, p)) {
      datetime_selector_bg.style.visibility = 'hidden';
      datetime_selector_bg.style.display = 'none';
    }
  }
  datetime_selector_bg.style.visibility = 'visible';
  datetime_selector_bg.style.display = 'block';
  const bg_rect = datetime_selector_bg.getBoundingClientRect();
  const input_rect = dateElement.getBoundingClientRect();
  const calendarContainer = document.getElementById('calendarContainer');
  calendarContainer.setAttribute('caller', dateElement.id);

  if (includeTime) {
    calendarContainer.style.width = "500px";
    document.getElementById('calendarTimeDivision').style.visibility = 'visible';
    document.getElementById('calendarTimeDivision').style.display = 'block';
    document.getElementById('calendarNow').innerHTML = 'Now';
  } else {
    document.getElementById('calendarTimeDivision').style.visibility = 'hodden';
    document.getElementById('calendarTimeDivision').style.display = 'none';
    document.getElementById('calendarNow').innerHTML = 'Today';
  }

  const calendar_rect = calendarContainer.getBoundingClientRect();
  const top1 = input_rect.top + input_rect.height + 2;
  const top2 = bg_rect.height - calendar_rect.height - 2;
  const top = (top1 + calendar_rect.height + 2) > bg_rect.height ? top2 : top1;
  const left1 = input_rect.left;
  const left2 = bg_rect.width - calendar_rect.width - 2;
  const left = (left1 + calendar_rect.width + 2) > bg_rect.width ? left2 : left1;

  calendarContainer.style.top = top.toString() + "px";
  calendarContainer.style.left = left.toString() + "px";
}

export function calendarShow(dateElement, includeTime) {
  calendarLayout(dateElement, includeTime);
  
  const value = parseInt(dateElement.getAttribute('dvalue'), 10) * 1000;
  document.getElementById('calendarContainer').setAttribute('date', value);
  document.getElementById('calendarReset').setAttribute('date', value);
  // document.getElementById('calendarNow').setAttribute('date', (new Date()).valueOf());
  document.getElementById('calendarContainer').setAttribute('includeTime', includeTime ? '1' : '0');
  showDate(value);
  showTime(value);

  document.getElementById('calendarClose').onclick = (event) => {
    const datetime_selector_bg = document.getElementById('datetime_selector_bg');
    datetime_selector_bg.style.visibility = 'hidden';
    datetime_selector_bg.style.display = 'none';
  }
  document.getElementById('calendarNow').onclick = (event) => {
    updateElement((new Date()).valueOf());
  }
  document.getElementById('calendarReset').onclick = (event) => {
    updateElement(event.target.getAttribute('date'));
  }
  document.getElementById('monthSelector').onmouseleave = () => {
    document.getElementById('monthSelector').style.visibility = 'hidden';
  }
  document.getElementById('calendarContainer').onmousedown = function(e) {
    const p = { x: e.clientX, y: e.clientY};
    const monthSelector = document.getElementById('monthSelector');
    const rect = monthSelector.getBoundingClientRect();
    if (!rect_contains(rect, p)) {
      monthSelector.style.visibility = 'hidden';
    }
  }
  document.getElementById('calendarYear').onchange = () => {
    changeYear();
  }
  document.getElementById('calendarSubYear').onclick = () => {
    subYear();
  }
  document.getElementById('calendarAddYear').onclick = () => {
    addYear();
  }
  document.getElementById('calendarMonth').onclick = () => {
    showMonthSelector();
  }
  document.getElementById('calendarSubMonth').onclick = () => {
    subMonth();
  }
  document.getElementById('calendarAddMonth').onclick = () => {
    addMonth();
  }

  const monthBoxes = document.querySelectorAll('.monthBox');
  monthBoxes.forEach(monthBox => {
    monthBox.onclick = (event) => {
      setMonth(event.target.getAttribute('value'));
      document.getElementById('monthSelector').style.visibility = 'hidden';
    }
  });

  const dateButtons = document.querySelectorAll('.dateButton');
  dateButtons.forEach(dateButton => {
    dateButton.onclick = (event) => {
      updateElement(event.target.getAttribute('value'));
    }
    // dateButton.onmouseover = (event) => {
    //   console.log(new Date(parseInt(event.target.getAttribute('value'), 10)));
    // }
  });

  document.getElementById('calendarTime').onchange = () => {
    changeTime();
  }
  
  const hourButtons = document.querySelectorAll('.hourButton');
  hourButtons.forEach(hourButton => {
    hourButton.onclick = (event) => {
      setHour(event.target.innerHTML);
    }
  });

  const minutesButtons = document.querySelectorAll('.minutesButton');
  minutesButtons.forEach(minutesButton => {
    minutesButton.onclick = (event) => {
      setMinutes(event.target.innerHTML);
    }
  });

  document.getElementById('button-min-dec').onclick = () => {
    subMinute();
  }

  document.getElementById('button-min-inc').onclick = () => {
    addMinute();
  }

  document.getElementById('button-AM').onclick = (e) => {
    setDayPart(e);
  }

  document.getElementById('button-PM').onclick = (e) => {
    setDayPart(e);
  }
}

function getCalendarDate() {
  return new Date(parseInt(document.getElementById('calendarContainer').getAttribute('date'), 10));
}

export function formatDate(date, includeTime) {
  
  const day = dayNames[date.getDay()];
  const datei = date.getDate() < 10 ? '0'.concat(date.getDate().toString()) : date.getDate().toString();
  const monthI = date.getMonth() + 1;
  const month = monthI < 10 ? '0'.concat(monthI.toString()) : monthI.toString();
  const year = date.getFullYear();

  let timeFormat = '';
  if (includeTime) {
    const hours = date.getHours();
    const minutes = date.getMinutes();
  
    const hour = hours < 10 ? '0'.concat(hours.toString()) : hours.toString();
    const min = minutes < 10 ? '0'.concat(minutes.toString()) : minutes.toString();

    timeFormat = ' '.concat(hour).concat(':').concat(min);
  }

  const dateFormated = day.concat(' ').concat(datei).concat('-').concat(month).concat('-').concat(year).concat(timeFormat);
  return dateFormated;
}

function updateElement(value) {
  document.getElementById('calendarContainer').setAttribute('date', value);
  showDate(value);
  showTime(value);

  const dateFormated = formatDate(new Date(parseInt(value, 10)), (document.getElementById('calendarContainer').getAttribute('includeTime') === '1'));

  const caller = document.getElementById('calendarContainer').getAttribute('caller');
  const dateElement = document.getElementById(caller);
  dateElement.value = dateFormated;
  dateElement.setAttribute('dvalue', parseInt(value, 10) / 1000);
}

function showDate(value) {
  const date = new Date(parseInt(value, 10));
  const year = date.getFullYear();
  const month = date.getMonth();
  const monthD = date.getDate();
  const hours = date.getHours();
  const minutes = date.getMinutes();

  // alert('getTimezoneOffset : ' + date.getTimezoneOffset());

  const selectedDateValue = (new Date(year, month, monthD, hours, minutes)).valueOf();

  const monthName = monthNames[month];

  document.getElementById('calendarYear').value = year;
  document.getElementById('calendarMonth').value = monthName;

  const firstOfMonth = new Date(year, month, 1, hours, minutes);
  const lastmonthdate = last_month_day(month, year);
  const lastOfMonth = new Date(year, month, lastmonthdate, hours, minutes);

  const oneDay = 24 * 60 * 60 * 1000;
  const firstOfMonth_weekday = firstOfMonth.getDay() === 0 ? 7 : firstOfMonth.getDay();
  const lastOfMonth_weekday = lastOfMonth.getDay() === 0 ? 7 : lastOfMonth.getDay();

  const prevMonday = new Date(firstOfMonth.valueOf() - ((firstOfMonth_weekday - 1) * oneDay));
  const nextSunday = new Date(lastOfMonth.valueOf() + ((7 - lastOfMonth_weekday) * oneDay));

  const prevMondayValue = prevMonday.valueOf();
  const nextSundayValue = nextSunday.valueOf();

  for (let i = 1; i <= 42; i++) {
    const dateButton = document.getElementById('dateButton-'.concat(i.toString()));
    dateButton.style.visibility = "visible";
    dateButton.style.opacity = 1;
    dateButton.style.border = '1px solid rgba(255, 255, 255, 0.3)';
  }

  let index = 1;
  let currentDateValue = prevMondayValue;
  while (currentDateValue <= nextSundayValue) {
    const currentDate = new Date(currentDateValue);
    const dateButton = document.getElementById('dateButton-'.concat(index.toString()));
    dateButton.setAttribute('value', currentDateValue);
    if (currentDate.getMonth() != month) {
      dateButton.style.opacity = 0.5;
    }

    // const compare1 = new Date(currentDateValue);
    // const compare2 = new Date(selectedDateValue);
    
    // const compare1D = (new Date(compare1.getFullYear(), compare1.getMonth(), compare1.getDate())).valueOf();
    // const compare2D = (new Date(compare2.getFullYear(), compare2.getMonth(), compare2.getDate())).valueOf();
    // console.log(compare1D);
    // console.log(compare2D);
    if (currentDateValue === selectedDateValue) {
      dateButton.style.border = '2px solid rgba(0, 0, 0, 1)';
    }
    dateButton.innerHTML = currentDate.getDate().toString();
    // currentDateValue += oneDay;
    currentDateValue = nextDateValue(currentDateValue);
    index += 1;
  }

  while (index <= 42) {
    const dateButton = document.getElementById('dateButton-'.concat(index.toString()));
    dateButton.style.visibility = "hidden";
    index += 1;
  }
}

function showTime(d) {
  const date = new Date(parseInt(d, 10));
  const hours = date.getHours();
  const minutes = date.getMinutes();

  const hoursL = hours < 10 ? '0'.concat(hours.toString()) : hours.toString();
  const minsL = minutes < 10 ? '0'.concat(minutes.toString()) : minutes.toString();
  
  const label = hoursL.concat(':').concat(minsL);
  document.getElementById('calendarTime').value = label;

  const hourLabelsAM = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', ]
  const hourLabelsPM = ['12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', ]
  for (let i = 0; i < 12; i++) {
    const hourButton = document.getElementById('hourButton-'.concat(i.toString()));
    hourButton.innerHTML = (hours < 12) ? hourLabelsAM[i] : hourLabelsPM[i];
  }
  if (hours < 12) {
    document.getElementById('button-AM').style.border = '2px solid rgba(0, 0, 0, 1)';
    document.getElementById('button-PM').style.border = '1px solid rgba(255, 255, 255, 0.3)';
  } else {
    document.getElementById('button-AM').style.border = '1px solid rgba(255, 255, 255, 0.3)';
    document.getElementById('button-PM').style.border = '2px solid rgba(0, 0, 0, 1)';
  }
}

function changeYear() {
  const d = getCalendarDate();
  const y = parseInt(document.getElementById('calendarYear').value, 10);
  if (isNaN(y)) {
    showDate(document.getElementById('calendarContainer').getAttribute('date'));
    return;
  }
  const m = d.getMonth();
  const n = d.getDate();
  const h = d.getHours();
  const o = d.getMinutes();

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function subYear() {
  const d = getCalendarDate();
  const y = d.getFullYear() - 1;
  const m = d.getMonth();
  const n = d.getDate();
  const h = d.getHours();
  const o = d.getMinutes();

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function addYear() {
  const d = getCalendarDate();
  const y = d.getFullYear() + 1;
  const m = d.getMonth();
  const n = d.getDate();
  const h = d.getHours();
  const o = d.getMinutes();

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function showMonthSelector() {
  const monthSelector = document.getElementById('monthSelector');
  monthSelector.style.visibility = "visible";

}

function setMonth(month) {
  const d = getCalendarDate();
  const y = d.getFullYear();
  const m = month
  const n = d.getDate();
  const h = d.getHours();
  const o = d.getMinutes();

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function subMonth() {
  const d = getCalendarDate();
  const y = d.getFullYear();
  const m = (d.getMonth() - 1) < 0 ? 11 : d.getMonth() - 1;
  const n = d.getDate();
  const h = d.getHours();
  const o = d.getMinutes();

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function addMonth() {
  const d = getCalendarDate();
  const y = d.getFullYear();
  const m = (d.getMonth() + 1) > 11 ? 0 : d.getMonth() + 1;
  const n = d.getDate();
  const h = d.getHours();
  const o = d.getMinutes();

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function changeTime() {
  
  const time = document.getElementById('calendarTime').value;
  const hourElements = time.split(":");
  let valid = true;
  let hours = 0;
  let minutes = 0;
  if (hourElements.length != 2) {
    valid = false;
  } else {
    if (hourElements[0].trim().length === 0) valid = false;
    if (hourElements[1].trim().length === 0) valid = false;
    if (isNaN(hourElements[0])) valid = false;
    if (isNaN(hourElements[1])) valid = false;
    hours = parseInt(hourElements[0], 10);
    minutes = parseInt(hourElements[1], 10);
    if (hours < 0) valid = false;
    if (hours > 23) valid = false;
    if (minutes < 0) valid = false;
    if (minutes > 59) valid = false;
  }
  if (!valid) {
    showTime(document.getElementById('calendarContainer').getAttribute('date'));
    return;
  }

  const d = getCalendarDate();
  const y = d.getFullYear();
  const m = d.getMonth();
  const n = d.getDate();
  const h = hours;
  const o = minutes;

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function setHour(hour) {
  const d = getCalendarDate();
  const y = d.getFullYear();
  const m = d.getMonth();
  const n = d.getDate();
  const h = parseInt(hour, 10);
  const o = d.getMinutes();

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function setDayPart(e) {
  const selection = e.target.innerHTML;
  const d = getCalendarDate();
  let hours = d.getHours();
  if (((hours < 12) && (selection === 'AM')) || ((hours >= 12) && (selection === 'PM'))) return;
  if (hours < 12) {
    hours += 12;
  } else {
    hours -= 12;
  }

  const y = d.getFullYear();
  const m = d.getMonth();
  const n = d.getDate();
  const h = hours;
  const o = d.getMinutes();

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function setMinutes(minutes) {
  const d = getCalendarDate();
  const y = d.getFullYear();
  const m = d.getMonth();
  const n = d.getDate();
  const h = d.getHours();
  const o = parseInt(minutes, 10);

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function subMinute() {
  const d = getCalendarDate();
  const y = d.getFullYear();
  const m = d.getMonth();
  const n = d.getDate();
  const h = d.getHours();
  const o = (d.getMinutes() - 1) < 0 ? 59 : d.getMinutes() - 1;

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}

function addMinute() {
  const d = getCalendarDate();
  const y = d.getFullYear();
  const m = d.getMonth();
  const n = d.getDate();
  const h = d.getHours();
  const o = (d.getMinutes() + 1) > 59 ? 0 : d.getMinutes() + 1;

  const newDate = (new Date(y, m, n, h, o)).valueOf();
  updateElement(newDate);
}