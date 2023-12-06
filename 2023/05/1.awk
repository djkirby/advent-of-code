/seeds/ {
    seeds = NF - 1
    for (i = 2; i <= NF; i++) s[i - 1] = $i
}
{
    for (i = 1; i <= seeds; i++)
        if (s[i] >= $2 && s[i] <= $2 + $3 && !mapped[maps, i]) {
            s[i] += $1 - $2
            mapped[maps, i] = 1
        }
}
/map/ { maps++ }
END {
    min = s[1]
    for (i = 1; i <= seeds; i++) min = s[i] < min ? s[i] : min
    print min
}
