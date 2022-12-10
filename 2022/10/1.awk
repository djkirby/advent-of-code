/a/ { o[NR]++ }
{ 
  for (i = 0; i < o[NR] + 1; i++) 
    s += (x + 1) * ((++c == 20 || !((c - 20) % 40)) ? c : 0) 
}
/a/ { x += $2 }
END { print s }