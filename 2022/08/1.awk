function ismax(_v, _i, _j, _x, _y) {
    return (!_i || _i > NR || !_j || _j > NF) || 
        ((_v > g[_i + _x, _j + _y]) && ismax(_v, _i +_x, _j + _y, _x, _y))
}

BEGIN { FS = "" }
{ for (i = 1; i <= NF; i++) g[NR, i] = $i }
END {
  for (i = 2; i < NR; i++) 
    for (j = 2; j < NF; j++) 
        t += ismax(g[i, j], i, j, 0, 1)  || 
             ismax(g[i, j], i, j, 1, 0)  ||
             ismax(g[i, j], i, j, -1, 0) || 
             ismax(g[i, j], i, j, 0, -1) 
  print t + (NF - 1) * 4
}