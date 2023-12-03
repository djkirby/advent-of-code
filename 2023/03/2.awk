BEGIN { l = 140; group++ }
$0 ~ /[0-9]/ {
    val[NR] = $0
    if (!start[group]) start[group] = NR
    end[group] = NR
    next
}
{ group++ }
$0 == "*" { symb[NR]++; symb2[++symbs] = NR; }
END {
    for (i = 1; i < group; i++) {
        for (j = end[i]; j >= start[i]; j--) {
            symbPos = 0
            sum[i] += 10 ^ places[i]++ * val[j]
            if (found[i]) continue
            if (symb[j - l + 1]) symbPos = j - l + 1
            if (symb[j - l]) symbPos = j - l
            if (symb[j - l - 1]) symbPos = j - l - 1
            if (symb[j + 1]) symbPos = j + 1
            if (symb[j - 1]) symbPos = j - 1
            if (symb[j + l - 1]) symbPos = j + l - 1
            if (symb[j + l]) symbPos = j + l
            if (symb[j + l + 1]) symbPos = j + l + 1
            if (symbPos) {
                if (!sums[symbPos]) sums[symbPos]++
                count[symbPos]++
                found[i]++
                targetSymb = symbPos
            }
        }
        if (found[i]) sums[targetSymb] *= sum[i]
    }
    for (i = 1; i <= symbs; i++)
        if (count[symb2[i]] == 2) t += sums[symb2[i]]
    print t
}
