function inc(x,y) {
  if (x > 0 && y > 0 && x <= NF && y <= NR && !flashed[step, x, y] && ++n[x, y] > 9) {
    n[x, y] = 0; 
    flashed[step, x, y]++;
    if (++total_flashed[step] == 100) {
      print step;
      exit;
    }
    inc(x, y - 1);
    inc(x, y + 1);
    inc(x - 1, y - 1);
    inc(x - 1, y);
    inc(x - 1, y + 1);
    inc(x + 1, y - 1);
    inc(x + 1, y);
    inc(x + 1, y + 1);
  }
}

BEGIN { FS = "" }
{ for (x = 1; x <= NF; x++) n[x, NR] = $x; }
END {
  while (++step) 
    for (y = 1; y <= NR; y++)
      for (x = 1; x <= NF; x++) 
        inc(x,y);
}