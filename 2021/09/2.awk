function min(a, b) { return b == "" || a < b; }

function in_basin(x, y) {
  if (m[x, y] == 9 || m[x, y] == "" || marked[x, y]) {
    marked[x, y]++;
    return;
  }
  marked[x, y]++;
  return 1 + in_basin(x - 1, y) + in_basin(x + 1, y) + in_basin(x, y - 1) + in_basin(x, y + 1);
}

BEGIN { FS = "" }
{ for (i = 1; i <= NF; i++) m[i, NR] = $i; }
END {
  for (y = 1; y <= NR; y++) 
    for (x = 1; x <= NF; x++) 
      if (min(m[x, y], m[x - 1, y]) && min(m[x, y], m[x + 1, y]) && min(m[x, y], m[x, y - 1]) && min(m[x, y], m[x, y + 1])) 
        print in_basin(x,y);
}