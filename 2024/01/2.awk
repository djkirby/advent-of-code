{
    r[$2]++;
    n[NR] = $1;
}
END {
    for (k in n) t += n[k] * r[n[k]]
    print t;
}
