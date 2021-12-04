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
  lines[$0] = 1;
  lines2[$0] = 1;
  sum += $1;
  gamma_bit1 = (.5 <= sum / NR)
}
END {
  gamma_bit = gamma_bit1;
  for (col = 1; col <= NF; col++) {
    next_matches = 0;
    matches = 0;
    curr_gamma_bit = gamma_bit;
    for (line in lines) {
      if (substr(line, col, 1) != curr_gamma_bit) {
        delete lines[line]
      } else {
        next_matches += substr(line, col + 1, 1);
        gamma_bit = .5 <= next_matches / ++matches;
        o2 = line
      }
    } 
  }

  epsilon_bit = !gamma_bit1;
  for (col = 1; col <= NF; col++) {
    next_matches = 0;
    matches = 0;
    curr_epsilon_bit = epsilon_bit;
    for (line in lines2) {
      if (substr(line, col, 1) != curr_epsilon_bit) {
        delete lines2[line]
      } else {
        next_matches += substr(line, col + 1, 1);
        epsilon_bit = .5 > next_matches / ++matches;
        co2 = line
      }
    } 
  }
  print bin2dec(o2) * bin2dec(co2)
}