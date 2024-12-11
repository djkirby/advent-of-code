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
                qr = 2 * r2 - r1;
                qc = 2 * c2 - c1;
                t += (qr > 0 && qc > 0 && qr <= NR && qc <= NF && !sq[qr, qc]++);
            }
        }
    }
}
END { print t }
