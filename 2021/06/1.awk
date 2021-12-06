BEGIN { FS = "," }
{ for (i = 1; i <= NF; i++) fish[i] = $i }
END {
  while (++days < 80) 
    for (e in fish) 
      if (--fish[e] < 0) {
        fish[e] = 6;
        fish[length(fish) + 1] = 8;
      }
  print length(fish);
}