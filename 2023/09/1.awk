{
    for (i = 1; i <= NF; i++) s[++ss[NR]] = $i;
    row_sum = $NF
    while (zeros = 0 < ss[NR]) {
        for (i = 1; i < ss[NR]; i++) zeros += !(s[i] = s[i + 1] - s[i])
        row_sum += s[--ss[NR]]
    }
    t += row_sum
}
END { print t }
