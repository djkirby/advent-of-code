BEGIN { RS = ","; }
{ turns[$1] = turns[$1] "," NR; }
END {
  last = $1;
  turn = NR;
  while (++turn <= 30000000) {
    count = split(turns[last], _turns, ",") - 2;
    last = count ? (turn - _turns[++count] - 1) : 0;
    count = split(turns[last], _turns, ",");
    if (count > 1)
      turns[last] = "," _turns[count] "," turn;
    else
      turns[last] = "," turn;
  }
  print last;
}