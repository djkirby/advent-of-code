{
    for (x = 0; x <= NF; x++) {
        for (i = 1; i <= NF; i++)
            if (x != i) r[NR, x, ++rr[NR, x]] = $i;
        z = 0;
        for (i = 1; i < rr[NR, x]; i++) {
            a = r[NR,x,i]
            n = r[NR,x,i + 1];
            d = a - n > 0 ? a - n : n - a;
            if ((r[NR,x,2] > r[NR,x,1]) != (n > a) || d < 1 || d > 3) z = 1;
        }
        if (!z) {
            t++;
            next;
        }
    }
}
END { print t }
