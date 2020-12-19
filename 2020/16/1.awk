BEGIN { RS = " |[a-z]|\n"; FS="[,-]"; }
/-/ { for (i = $1; i <= $2; i++) valid[i]++; }
/,/ && ++n > 1 { for (i = 1; i <= NF; i++) sum += valid[$i] ? 0 : $i; }
END { print sum; }