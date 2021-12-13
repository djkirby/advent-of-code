function inc(_x,_y) {
  if (_x < 1 || _y < 1 || _x > NF || _y > NR) {
    return;
  }
  if (!flashed[a,_x,_y]) {
    if (++n[_x,_y] == 10) {
      n[_x,_y] = 0; 
      flashed[a,_x,_y]++;
      f++;
      ff[a]++;
      if (ff[a] == 100) {
        print a;
        exit;
      }
      inc(_x,_y-1);
      inc(_x,_y+1);
      inc(_x-1,_y-1);
      inc(_x-1,_y);
      inc(_x-1,_y+1);
      inc(_x+1,_y-1);
      inc(_x+1,_y);
      inc(_x+1,_y+1);
    }
  } else if (flashed[a,_x,_y]) {
    return;
  }
}

BEGIN { 
  FS = ""
}
{
  for (x = 1; x <= NF; x++) n[x, NR] = $x;
}
END {
    print "-" a "-"
    for (y = 1; y <= NR; y++) {
      s=""
      for (x = 1; x <= NF; x++) {
        s = s n[x, y]
      }
      print s
    }

    print "-"
  while (a++ || 1) {
    for (y = 1; y <= NR; y++) {
      for (x = 1; x <= NF; x++) {
        inc(x,y);
      }
    }
    for (y = 1; y <= NR; y++) {
      s=""
      for (x = 1; x <= NF; x++) {
        s = s n[x, y]
      }
      print s
    }
    print "-"
    print f
  }
}