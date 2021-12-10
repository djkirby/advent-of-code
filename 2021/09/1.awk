function min(a, b) { return b == "" || a < b; }

BEGIN { FS = "" }
{ for (i = 1; i <= NF; i++) m[i, NR] = $i; }
END {
  for (y = 1; y <= NR; y++) 
    for (x = 1; x <= NF; x++) 
      if (min(m[x, y], m[x - 1, y]) && min(m[x, y], m[x + 1, y]) && min(m[x, y], m[x, y - 1]) && min(m[x, y], m[x, y + 1])) 
        t += m[x, y] + 1;
  print t
}