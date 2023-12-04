{
    t += count[NR] + 1
    for (i = 1; i <= NF; i++)
        matches[NR] += (seen[NR, $i]++ && seen[NR, "|"])
    for (i = 1; i <= count[NR] + 1; i++)
        for (j = NR + 1; j <= NR + matches[NR]; count[j++]++)
}
END { print t }
