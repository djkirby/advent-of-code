awk '
    /d [a-z]/ { d[++l] = $3 (++o[$3]) }
    /^[1-9]/ { 
        for (e in d) s[d[e]] += $1 
        t += $1
    }
    /\.\./ { delete d[l--] }
    END { 
        print  "! ", t - 40000000
        for (e in s) print s[e], e
    }
' input | sort -n | awk '
  NR == 1 { n = $2 }
  $1 > n { print $1; exit }
'