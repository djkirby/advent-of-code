BEGIN { FS = "" }
{
    for (i = 1; i < NF; i++) {
        if ($i > m[NR]) {
            m[NR] = $i
            n[NR] = $(i + 1)
        } else if ($i > n[NR]) n[NR] = $i;
    }
    t += m[NR] * 10 + ($NF > n[NR] ? $NF : n[NR])
}
END { print t }
