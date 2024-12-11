function withinBounds(r1, c1) {
    return r1 > 0 && c1 > 0 && r1 <= NR && c1 <= NF;
}

function traverse(r1, c1, r2, c2, zr, zc) {
    a = withinBounds(r1, c1);
    b = withinBounds(r2, c2);
    t += (a && !q[r1, c1]++) + (b && !q[r2, c2]++);
    if (!a && !b) return;
    traverse(r1 - zr, c1 - zc, r2 + zr, c2 + zc, zr, zc)
}

BEGIN { FS = "" }
{
    for (i = 1; i <= NF; i++) {
        if ($i != ".") {
            dr[$i, ++n[$i]] = NR;
            dc[$i, n[$i]] = i;
            dl[$i]++;
        }
    }
}
END {
    for (k in dl) {
        for (kk = 1; kk <= n[k]; kk++) {
            for (jj = 1; jj <= n[k]; jj++) {
                r1 = dr[k, kk];
                c1 = dc[k, kk];
                r2 = dr[k, jj];
                c2 = dc[k, jj];
                if (r1 == r2 && c1 == c2) continue;
                zr = r2 - r1;
                zc = c2 - c1;
                c = traverse(r1, c1, r2, c2, r2 - r1, c2 - c1);
            }
        }
    }
}
END { print t }
