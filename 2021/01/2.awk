{ 
  c += ($1 + p1 + p2 > p1 + p2 + p3);
  p3 = p2;
  p2 = p1;
  p1 = $1; 
}
END { print c - 3; }