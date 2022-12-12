awk '
  BEGIN { num = 0 }
  { gsub(",", "", $0) }
  /item/ { for (i = 3; i <= NF; i++) items[num, c[num]++] = $i }
  /Operation/ { op[num] = $5; by[num] = $6 }
  /Test/ { div[num] = $4 }
  /true/ { t[num, 1] = $6 }
  /false/ { t[num++, 0] = $6 }
  END {
    for (r = 1; r <= 20; r++) 
      for (i = 0; i < num; i++) 
        for (j = 0; j < c[i]; j++) { 
          if (!items[i, j]) continue
          inspec[i]++
          b = by[i] == "old" ? items[i, j] : by[i]
          newval = int((op[i] == "*" ? items[i, j] * b : items[i, j] + b) / 3)  
          to = t[i, !(newval % div[i])]
          items[to, c[to]++] = newval
          delete items[i, j]
        } 
    for (i = 0; i < num; i++) print inspec[i]
  }
' input | sort -n | tail -n 2 | awk '{e[NR]=$1}END{print e[1]*e[2]}'