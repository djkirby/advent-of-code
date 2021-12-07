BEGIN { RS = "," }
{ nums[$1]++ }
END {
  for (p1 in nums) {
    for (p2 in nums) 
      fuel[p1] += nums[p2] * (p2 - p1 > 0 ? p2 - p1 : p1 - p2);
    if (!minPos || fuel[p1] < fuel[minPos]) 
      minPos = p1;
  }
  print fuel[minPos]
}