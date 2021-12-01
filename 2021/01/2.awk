{ l[++n] = $1 }
END {
  for (i = 4; i <= n; i++)  {
    prev = curr;
    curr = l[i - 2] + l[i - 1] + l[i];
    c += (curr > prev);
  }
  print c;
}