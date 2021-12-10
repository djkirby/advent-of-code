BEGIN { 
  FS = "";
  matching["<"] = ">";
  matching["["] = "]";
  matching["{"] = "}";
  matching["("] = ")";
  val[")"] = 3;
  val["]"] = 57;
  val["}"] = 1197;
  val[">"] = 25137;
}
{
  l = 0;
  for (i = 1; i <= NF; i++) {
    if (matching[$i]) {
      stack[NR, ++l] = $i;
    } else if ($i != matching[stack[NR, l]]) {
      t += val[$i];
      break;
    } else {
      delete stack[NR, l--];
    }
  }
}
END { print t }