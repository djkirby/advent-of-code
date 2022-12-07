/d [a-z]/ { d[++l] = $3 (++o[$3]) }
/^[1-9]/ { for (e in d) s[d[e]] += $1 }
/\.\./ { delete d[l--] }
END { for (e in s) t += s[e] <= 100000 ? s[e] : 0; print t }