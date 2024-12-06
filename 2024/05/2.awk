BEGIN { FS = "[\|,]" }
/\|/ { d[$1, $2] = 1 }
/,/ {
    for (i = 1; i <= NF; i++) r[NR, i] = $i;
    while (++x) {
        for (i = 1; i < NF; i++) {
            a = r[NR, i]
            if (d[r[NR, i + 1], a]) {
                r[NR, i] = r[NR, i + 1]
                r[NR, i + 1] = a
                q[x] = 1
                qq[NR] = 1
            }
        }
        if (!q[x]) break;
    }
    if (qq[NR]) t += r[NR, int(NF / 2) + 1];
}
END { print t }
