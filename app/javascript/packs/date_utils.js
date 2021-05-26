export function last_month_day(m, y) {
  switch (m) {
    case 0:
    case 2:
    case 4:
    case 6:
    case 7:
    case 9:
    case 11:
      return 31;
    case 1: return isLipYear(y) ? 29 : 28;
    case 3:
    case 5:
    case 8:
    case 10:
      return 30;
  }
}

function isLipYear(y) {
  const is4y = ((y % 4) === 0) ? true : false;
  const is100y = ((y % 100) === 0) ? true : false;
  const is400y = ((y % 400) === 0) ? true : false;

  return (is4y && !is100y && is400y)
}

export function nextDateValue(value) {
  const d = new Date(value)
  const y = d.getFullYear();
  const m = d.getMonth();
  const n = d.getDate() + 1;
  const h = d.getHours();
  const o = d.getMinutes();

  return (new Date(y, m, n, h, o)).valueOf();
}

function dateShiftYear(date, shift) {
  const y = date.getUTCFullYear() + shift;
  const m = date.getUTCMonth();
  const n = date.getUTCDate();
  const h = date.getUTCHours();
  const o = date.getUTCMinutes();

  return (new Date(y, m, n, h, o)).valueOf();

}