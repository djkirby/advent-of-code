function bin2dec(val, _result) {
  base = 1;
  while (val) {
    last_digit = substr(val, length(val), 1);
    val = substr(val, 1, length(val) - 1)
    _result += last_digit * base;
    base *= 2;
  }
  return _result;
}

BEGIN { FS = "" }
{
  gamma = ""; epsilon = "";
  for (x = 1; x <= NF; x++)  {
    count[x] += $x;
    gamma = gamma (.5 <= count[x] / NR)
    epsilon = epsilon (.5 > count[x] / NR)
  }
}
END { print bin2dec(gamma) * bin2dec(epsilon) }