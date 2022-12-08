function score(_v, _i, _j, _x, _y) {
  if (_i < 2 || _i > NR - 1 || _j < 2 || _j > NF - 1) return 0
  return 1 + (_v > g[_i + _x, _j + _y] ? score(_v, _i +_x, _j + _y, _x, _y) : 0)
}

BEGIN { FS = "" }
{ for (i = 1; i <= NF; i++) g[NR, i] = $i }
END {
  for (i = 2; i < NR; i++) 
    for (j = 2; j < NF; j++) {
      l = score(g[i, j], i, j, -1, 0)
      r = score(g[i, j], i, j, 0, 1)
      d = score(g[i, j], i, j, 1, 0)
      u = score(g[i, j], i, j, 0, -1) 
      s = l * r * d * u
      if (s > m) m = s
    }
  print m
}