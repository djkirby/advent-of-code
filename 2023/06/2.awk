{ for (i = 1; i < NF; i++) d[NR] = (d[NR] $(i + 1)) + 0 }
END {
    for (i = 1; i < d[1]; i++) t += (d[1] - i) * i > d[2]
    print t
}
