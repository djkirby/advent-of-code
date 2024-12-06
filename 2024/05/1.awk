BEGIN { FS = "[\|,]" }
/\|/ { d[$1, $2] = 1 }
/,/ {
    for (i = 1; i < NF; i++)
        for (j = 1; j < NF; j++)
            b[NR] = i > j && d[$i, $j] || b[NR];
    t += $(NF / 2 + 1) * !b[NR]
}
END { print t }
