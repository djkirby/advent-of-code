BEGIN { l = 140; group++ }
$0 ~ /[0-9]/ {
    val[NR] = $0
    if (!start[group]) start[group] = NR
    end[group] = NR
    next
}
{ group++ }
$0 != "." { symb[NR]++ }
END {
    for (i = 1; i < group; i++) {
        for (j = end[i]; j >= start[i]; j--) {
            sum[i] += 10 ^ places[i]++ * val[j]
            if (symb[j - l + 1] ||
                symb[j - l] ||
                symb[j - l - 1] ||
                symb[j + 1] ||
                symb[j - 1] ||
                symb[j + l - 1] ||
                symb[j + l] ||
                symb[j + l + 1]) found[i]++
        }
        if (found[i]) t += sum[i]
    }
    print t
}
