BEGIN { FS = " -> |," }
$1 == $3 {  # VERTICAL
  for (y = $2; y <= $4; y++)  # N->S
    board[$1][y]++;
  for (y = $4; y <= $2; y++)  # S->N
    board[$1][y]++;
  maxy = $4 > maxy ? $4 : $2 > maxy ? $2 : maxy;
  maxx = $1 > maxx ? $1 : maxx;
}
$2 == $4 {  # HORIZONTAL
  for (x = $1; x <= $3; x++)  # W->E
    board[x][$2]++;
  for (x = $3; x <= $1; x++)  # E->W
    board[x][$2]++;
  maxx = $3 > maxx ? $3 : $1 > maxx ? $1 : maxx;
  maxy = $2 > maxy ? $2 : maxy;
}
END {
  for (y = 0; y <= maxy; y++) 
    for (x = 0; x <= maxx; x++) 
      count += board[x][y] > 1;
  print count;
}