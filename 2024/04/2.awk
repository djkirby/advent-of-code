BEGIN { FS = "" }
{ for (i = 1; i <= NF; i++) x[NR, i] = $i }
END {
    for (i = 1; i <= NR; i++) {
        for (j = 1; j <= NF; j++) {
            if (x[i, j] == "A") {
                a = x[i - 1, j - 1];
                b = x[i + 1, j + 1];
                c = x[i - 1, j + 1];
                d = x[i + 1, j - 1];
                if (((a == "S" && b == "M") || ((a == "M" && b == "S"))) &&
                    ((c == "S" && d == "M") || ((c == "M" && d == "S"))))
                        t++;
            }
        }
    }
    print t;
}
