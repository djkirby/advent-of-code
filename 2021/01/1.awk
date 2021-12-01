{ l[++n] = $1 }
END {
  for (i = 2; i <= n; i++) 
    c += (l[i] > l[i - 1]);
  print c;
}