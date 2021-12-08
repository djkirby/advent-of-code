function bin(chars, s) {
  s = s !!index(chars, "a")
  s = s !!index(chars, "b")
  s = s !!index(chars, "c")
  s = s !!index(chars, "d")
  s = s !!index(chars, "e")
  s = s !!index(chars, "f")
  s = s !!index(chars, "g")
  return s
}

function difference(a, b) {
  split(a, chars, "");
  for (e in chars) 
    if (!index(b, chars[e])) 
      return chars[e];
}

{
  for (e in mapping) 
    delete mapping[e];
  for (e in mapped) 
    delete mapped[e];
  for (i = 1; i <= 10; i++) {
    l = length($i);
    if (l == 2) 
      mapping[1] = $i;
    else if (l == 3)
      mapping[7] = $i;
    else if (l == 4)
      mapping[4] = $i;
    else if (l == 7)
      mapping[8] = $i;
  }
  segment[1] = difference(mapping[7], mapping[1]);
  for (i = 1; i <= 10; i++) {
    if (length($i) == 6) {
      a = substr(mapping[1], 1, 1)
      b = substr(mapping[1], 2, 1)
      if (!index($i, a) || !index($i, b)) {
        mapping[6] = $i; 
        mapped[$i]++;
        if (!index($i, a)) {
          segment[6] = b;
          segment[3] = a;
        } else {
          segment[6] = a;
          segment[3] = b;
        }
      } 
    }
  }
  for (i = 1; i <= 10; i++) 
    if (length($i) == 5) 
      if (!index($i, segment[3])) 
        mapping[5] = $i;
  for (i = 1; i <= 10; i++) 
    if (length($i) == 5) 
      if (!index($i, segment[6])) 
        mapping[2] = $i;
  for (e in mapping) 
    mapped[mapping[e]]++;
  for (i = 1; i <= 10; i++) {
    if (length($i) == 5) {
      if (!mapped[$i]) {
        mapping[3] = $i;
        mapped[$i]++;
      }
    }
  }
  segment[5] = difference(mapping[6], mapping[5])
  for (i = 1; i <= 10; i++) {
    if (length($i) == 6) {
      if (index($i, segment[5]) && !mapped[$i]) {
        mapped[$i]++;
        mapping[0] = $i;
      } else if (!mapped[$i]) {
        mapping[9]=$i;
        mapped[$i]++
      }
    }
  }
  d=""
  for (i = 12; i <= 15; i++) 
    for (e in mapping) 
      if (bin(mapping[e]) == bin($i)) 
        d = d e 
  tot += d
}
END {  print tot}