function abs(n) { return n < 0 ? -n : n }

/a/ { o[NR]++ }
{ 
  for (i = 0; i < o[NR] + 1; i++) {
    printf("%s", abs((p++ % 40) - x - 1) < 2 ? "#" : ".")
    if (!(++c % 40)) print ""
  }
}
/a/ { x += $2 }