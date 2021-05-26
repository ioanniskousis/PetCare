export function rect_contains(rect, p) {
  if ((rect.left <= p.x) && (rect.left + rect.width >= p.x) && (rect.top <= p.y) && (rect.top + rect.height >= p.y)) {
    return true;
  }
  return false;
}
