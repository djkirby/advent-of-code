function count(days, n) {
  if (memo[days, n]) 
    return memo[days, n];
  memo[days, n] = !days ? 1 : !n ? count(days - 1, 6) + count(days - 1, 8) : count(days - 1, n - 1);
  return memo[days, n];
}

BEGIN { RS = "," }
{ total += count(256, $1) }
END { print total }