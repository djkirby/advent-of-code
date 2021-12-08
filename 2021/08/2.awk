{
  for (i = 12; i < 16; i++) 
    if (length($i) == 2 || length($i) == 3 || length($i) == 4 || length($i) == 7)
      t++;
}
END { print t }