BEGIN { FS = "" }
{
    for (i = 1; i <= NF; i++) {
        q[NR, i] = $i == "#";
        if ($i == "^") {
            r = NR;
            c = i;
            ir = r;
            ic = c;
        }
    }
}
END {
    for (i = 1; i <= NR; i++) {
        for (j = 1; j <= NF; j++) {
            dr = -1;
            dc = 0;
            r = ir;
            c = ic;
            while (r <= NR && r > 0 && c <= NF && c > 0) {
                if (++p[i, j, r, c, dr, dc] > 1) {
                    o++;
                    k = 1;
                    break;
                }
                if (!q[r + dr, c + dc] && !(r + dr == i && c + dc == j)) {
                    r += dr;
                    c += dc;
                    continue;
                }
                a = dr == 1 || !dc ? 0 : dc < 0 ? -1 : 1;
                b = dr == 1 ? -1 : !dc
                dr = a;
                dc = b;
            }
            if (k) {
                k = 0;
                continue;
            }
        }
    }
    print o
}
