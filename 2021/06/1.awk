function count(days, n) {
  return !days ? 1 : !n-- ? count(days - 1, 6) + count(days - 1, 8) : count(days - 1, n);
}


BEGIN { RS = "," }
{ total += count(80, $1) }
END { print total }