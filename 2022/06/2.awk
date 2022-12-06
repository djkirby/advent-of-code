BEGIN { FS = "" }
{
  for (i = 1; i <= NF - 3; i++) {
    c = 0
    for (x = 0; x <= 13; x++) 
      for (y = 0; y <= 13; y++) 
        c += ($(i + x) != $(i + y)) 
    if (c == 182) {
      print i + 13
      exit
    }
  }
}