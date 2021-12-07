BEGIN { RS = "," }
{ nums[$1]++ }
END {
  for (p1 in nums) {
    for (p2 in nums) 
      fuel[p1] += nums[p2] * (p2 - p1 > 0 ? p2 - p1 : p1 - p2);
    minPos = !minPos || fuel[p1] < fuel[minPos] ? p1 : minPos;
  }
  print fuel[minPos]
}