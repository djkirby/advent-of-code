BEGIN { FS = "" }
{
    for (i = 1; i <= NF; i++) {
        q[NR, i] = $i == "#";
        if ($i == "^") {
            r = NR;
            c = i;
        }
    }
}
END {
    dr = -1;
    while (r <= NR && r > 0 && c <= NF && c > 0) {
        t += !v[r, c]++;
        if (!q[r + dr, c + dc]) {
            r += dr;
            c += dc;
            continue;
        }
        a = dr == 1 || !dc ? 0 : dc < 0 ? -1 : 1;
        b = dr == 1 ? -1 : !dc
        dr = a;
        dc = b;
    }
    print t;
}
