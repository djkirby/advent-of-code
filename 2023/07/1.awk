function val(h, _v, _a) {
    split(h, _a, "")
    for (i = 1; i <= 5; i++) _v += v[_a[i]] * 100 ^ (5 - i)
    return _v
}

BEGIN {
    for (i = 2; i <= 9; i++) v[i] = i
    v["T"] = 10; v["J"] = 11; v["Q"] = 12; v["K"] = 13; v["A"] = 14
}
{
    if (system("perl -le \"exit \\\"" $1 "\\\" =~ /(.).*\\1.*\\1.*\\1.*\\1/\"")) { print 7, val($1), $0; next }
    if (system("perl -le \"exit \\\"" $1 "\\\" =~ /(.).*\\1.*\\1.*\\1/\"")) { print 6, val($1), $0; next }
    n = split($1, a, "")
    for (i = 1; i <= n; i++) found[NR, a[i]]++
    for (i = 1; i <= n; i++) {
        three[NR] += (found[NR, a[i]] == 3)
        pair[NR] += (found[NR, a[i]] == 2)
    }
    if (three[NR] && pair[NR]) { print 5, val($1), $0; next }
    if (system("perl -le \"exit \\\"" $1 "\\\" =~ /(.).*\\1.*\\1/\"")) { print 4, val($1), $0; next }
    n = split($1, a, "")
    for (i = 1; i <= n; i++) {
        pair2[NR] += (++found2[NR, a[i]] == 2)
        if (pair2[NR] == 2) { print 3, val($1), $0; next }
    }
    if (system("perl -le \"exit \\\"" $1 "\\\" =~ /(.).*\\1/\"")) { print 2, val($1), $0; next }
    print 1, val($1), $0
}
