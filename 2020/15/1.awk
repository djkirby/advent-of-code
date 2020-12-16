BEGIN { RS = ","; }
{ turns[$1] = turns[$1] "," NR; }
END {
  last = $1;
  turn = NR;
  while (++turn <= 2020) {
    count = split(turns[last], _turns, ",") - 2;
    last = count ? (turn - _turns[++count] - 1) : 0;
    turns[last] = turns[last] "," turn;
  }
  print last;
}