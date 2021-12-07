function dist(n) { 
  if (memo[n])
    return memo[n];
  memo[n] = !n ? 0 : n + dist(n - 1); 
  return memo[n];
}

BEGIN { RS = "," }
{ nums[$1]++ }
END {
  for (p1 in nums) {
    for (p2 in nums) 
      fuel[p1] += nums[p2] * dist(p2 - p1 > 0 ? p2 - p1 : p1 - p2);
    minPos = !minPos || fuel[p1] < fuel[minPos] ? p1 : minPos;
  }
  print fuel[minPos]
}