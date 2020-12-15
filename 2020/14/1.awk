function leftPad(val, n) {
  if (length(val) < n) 
    return leftPad(0 val, n)
  return val;
}

function dec2bin(val, _result) {
  while (val) {
    _result = (val % 2) _result
    val = int(val / 2)
  }
  return leftPad(_result, 36);
}

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

function masked(val, _result) {
  for (i = 1; i <= length(val); i++) {
    n = substr(val, i, 1);
    m = substr(mask, i, 1);
    _result = _result (m == "X" ? n : m)
  }
  return _result;
}

BEGIN { FS = " = "; }
/mask/ { mask = $2; }
/mem/ { 
  addr = substr($1, 5, length($1) - 5);
  mem[addr] = bin2dec(masked(dec2bin($2)));
}
END {
  for (a in mem) 
    sum += mem[a]
  print sum
}