{
    for (i = 1; i <= NF; i++) s[++ss[NR]] = $i;
    while (zeros = 0 < ss[NR]) {
        e[++es[NR]] = s[1]
        for (i = 1; i < ss[NR]; i++) zeros += !(s[i] = s[i + 1] - s[i])
        ss[NR]--
    }
    for (i = es[NR] - 1; i; i--) p[NR] = e[i] - p[NR]
    t += p[NR]
}
END { print t }
