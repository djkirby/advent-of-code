awk 'BEGIN {RS = "\n\n"} {for (i = 1; i <= NF; i++) s[NR] += $i; print s[NR]}' input \
  | sort -n \
  | tail -n 3 \
  | awk '{s += $1} END {print s}'