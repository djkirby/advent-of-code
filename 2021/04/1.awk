function winner(_board, _b, _c, curr, row, col, streak, e) {
  for (e in _board) {
    curr = _board[e]
    row = (e-1)% 5+1;
    col = int((e -1)/ 5)+1;
    _b[row][col] = curr;
    _c[col][row] = curr;
  }

  for (row in _b) {
    streak = 0;
    for (col in _b[row]) {
      if (_b[row][col] == -1) {
        streak++;
      }
      if (streak == 5) {
        return 1;
      }
    }
  }

  for (col in _c) {
    streak = 0;
    for (row in _c[col]) {
      if (_c[col][row] == -1) {
        streak++;
      }
      if (streak == 5) {
        return 1;
      }
    }
  }

  streak = 0;
  for (i = 1; i <= 5; i++) {
    if (_b[i][i] == -1) {
      streak++;
    }
    if (streak == 5) {
      return 1;
    }
  }
}

function score(b, num, e, sum) {
  sum = 0;
  for (a in b) {
    if (b[a] != -1) {
      sum += b[a];
    }
  }
  return sum * num;
}

BEGIN { RS = ""; }
NR == 1 {
  split($0, nums, ",")
}
NR > 1 {
  for (i = 1; i <= NF; i++) {
    board[NR - 1][i] = $i;
  }
}
END {
  boards = length(board)
  for (k in nums) {
    num = nums[k]

    for (e in board) {
      for (x in board[e]) {
        curr = board[e][x]
        if (num == curr) {
          board[e][x] = -1;
        }
      }
      if (winner(board[e])) {
        print score(board[e], num, e),e
        done[e]=1;
        s=0;
        for (z = 1; z <= boards; z++) {
          if (done[z]) {
            s++;
          }
        }
        if (s == boards) {
          exit
        }
       # exit
      }
    }
  }
}