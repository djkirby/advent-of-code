{ 
  c += $1 > prev;
  prev = $1; 
}
END { print --c; }