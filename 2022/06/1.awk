BEGIN { FS = "" }
{
  for (i = 1; i <= NF - 3; i++) {
    c = 0
    for (x = 0; x <= 3; x++) 
      for (y = 0; y <= 3; y++) 
        c += ($(i + x) != $(i + y)) 
    if (c == 12) {
      print i + 3
      exit
    }
  }
}