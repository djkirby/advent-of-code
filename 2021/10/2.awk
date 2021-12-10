BEGIN { 
  FS = "";
  matching["<"] = ">";
  matching["["] = "]";
  matching["{"] = "}";
  matching["("] = ")";
  val[")"] = 1;
  val["]"] = 2;
  val["}"] = 3;
  val[">"] = 4;
}
{
  l = 0;
  for (i = 1; i <= NF; i++) {
    if (matching[$i]) {
      stack[NR, ++l] = $i;
    } else if ($i != matching[stack[NR, l]]) {
      broke[NR]++
      break;
    } else {
      delete stack[NR, l--];
    }
  }
  if (!broke[NR]) 
    while (l) 
      n[NR] = n[NR] * 5 + val[matching[stack[NR, l--]]];
  if (n[NR]) 
    print n[NR];
}