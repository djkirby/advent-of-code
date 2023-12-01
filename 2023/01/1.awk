BEGIN { FS = "" }
{
    d1 = d2 = ""
    for (i = 1; i <= NF; i++)
        if ($i ~ /[1-9]/) {
            if (!d1) d1 = $i
            d2 = $i
        }
    t += d1 * 10 + d2
}
END { print t }
