function abs(n) { return n < 0 ? -n : n }

function getMovementX(hx, hy, tx, ty) {
  if (abs(hx - tx) < 2 && abs(hy - ty) < 2) 
    return 0
  if (hy == ty) 
    return hx > tx ? 1 : -1
  if (hx == tx) 
    return 0
  return hx > tx ? 1 : -1
}

function getMovementY(hx, hy, tx, ty) {
  if (abs(hx - tx) < 2 && abs(hy - ty) < 2) 
    return 0
  if (hy == ty) 
    return 0;
  if (hx == tx) 
    return hy > ty ? 1 : -1
  return hy > ty ? 1 : -1
}

function step(x, y, limit) {
  c = !x
  p[0, c] += c ? y : x
  for (q = 0; q <= limit - 1; q++) {
    mx = getMovementX(p[q, 0], p[q, 1], p[q + 1, 0], p[q + 1, 1])
    my = getMovementY(p[q, 0], p[q, 1], p[q + 1, 0], p[q + 1, 1])
    p[q + 1, 0] += mx
    p[q + 1, 1] += my
    if (q == limit - 1)
      n += !v[p[q+1, 0], p[q+1, 1]]++
  }
}

function move(b, g) {
  for (i = 1; i <= $2; i++) 
    step(b, g, 9)
}

/R/ { move(1, 0) } 
/U/ { move(0, 1) } 
/L/ { move(-1, 0) } 
/D/ { move(0, -1) }
END { print n }