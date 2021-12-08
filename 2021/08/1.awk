{
  for (i = 12; i < 16; i++) 
    t += (length($i) == 2 || length($i) == 3 || length($i) == 4 || length($i) == 7);
}
END { print t }