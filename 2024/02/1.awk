{
    for (i = 1; i < NF; i++) {
        n = $(i + 1);
        d = $i - n > 0 ? $i - n : n - $i;
        if (($2 > $1) != (n > $i) || d < 1 || d > 3) next;
    }
    t++;
}
END { print t }
