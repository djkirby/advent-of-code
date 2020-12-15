function leftPad(val, n) {
  if (length(val) < n) 
    return leftPad(0 val, n);
  return val;
}

function dec2bin(val, _result) {
  while (val) {
    _result = (val % 2) _result;
    val = int(val / 2);
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
    _result = _result (m == 0 ? n : m);
  }
  return _result;
}

function floatingAddresses(val, _list) {
  if (!index(val, "X")) 
    return val;
  tmp = val;
  sub(/X/, 0, tmp);
  _list = _list (_list ? "," : "") floatingAddresses(tmp);
  sub(/X/, 1, val);
  _list = _list (_list ? "," : "") floatingAddresses(val);
  return _list;
}

BEGIN { FS = " = "; }
/mask/ { mask = $2; }
/mem/ { 
  addr = substr($1, 5, length($1) - 5);
  maskedAddr = masked(dec2bin(addr));
  floatingAddrs = floatingAddresses(maskedAddr);
  split(floatingAddrs, addrs, ",");
  for (k in addrs) 
    mem[addrs[k]] = $2;
}
END {
  for (addr in mem) 
    sum += mem[addr];
  print sum;
}