function winner(board) {
  for (z in board) {
    row = (z - 1) % 5 + 1;
    col = int((z -1) / 5) + 1;
    b1[row][col] = b2[col][row] = board[z];
  }
  return hasFilledRow(b1) || hasFilledRow(b2);
}

function hasFilledRow(board) {
  for (row in board) {
    streak = 0;
    for (col in board[row]) {
      streak += board[col][row] < 0;
      if (streak > 4) 
        return 1;
    }
  }
}

function score(board, num, _sum, _e) {
  for (_e in board) 
    _sum += board[_e] > -1 ? board[_e] : 0;
  return _sum * num;
}

BEGIN { RS = "" }
NR == 1 { split($0, nums, ",") }
NR > 1 { for (i = 1; i <= NF; i++) board[NR - 1][i] = $i }
END {
  for (k in nums) {
    for (e in board) {
      if (done[e]) continue
      for (cell in board[e]) 
        if (nums[k] == board[e][cell]) 
          board[e][cell] = -1;
      if (winner(board[e])) {
        done[e]++;
        if (++total_done == length(board)) 
          print score(board[e], nums[k])
      }
    }
  }
}