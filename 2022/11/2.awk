BEGIN { num = 0 }
{ 
  gsub(",", "", $0); 
  gsub(/\* old/, "* 1", $0); 
}
/item/ { for (i = 3; i <= NF; i++) items[num, c[num]++] = $i }
/Operation/ { op[num] = $5; by[num] = $6 }
/Test/ { div[num] = $4 }
/true/ { t[num, 1] = $6 }
/false/ { t[num++, 0] = $6 }
END {
  for (r = 1; r <= 1; r++) 
    for (i = 0; i < num; i++) {
      print "Monkey " i;
      for (j = 0; j < c[i]; j++) { 
        if (!items[i, j]) continue
        print "  val=" items[i,j]
        inspec[i]++
        b = op[i] == "old" ? item[i,j] : by[i]
        # print "  need to " op[i] " by " b
        # handle old + old
        newval = op[i] == "*" ? items[i, j] * b : items[i, j] + b
        # print newval
        to = t[i, !(newval % div[i])]
        print "  newval=" newval
        items[to, c[to]++] = newval
        delete items[i, j]
        print "  -"
      } 
    }
  for (i = 0; i < num; i++) print inspec[i]
}