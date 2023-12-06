{ for (i = 1; i < NF; i++) d[i, NR] = $(i + 1) }
END {
    t = 1
    for (i = 1; i < NF; i++) {
        for (j = 1; j < d[i, 1]; j++) r[i] += (d[i, 1] - j) * j > d[i, 2]
        t *= r[i]
    }
    print t
}
