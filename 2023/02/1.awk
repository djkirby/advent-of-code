BEGIN { FS = ", |: |; |Game " }
{
    for (i = 3; i <= NF; i++) {
        split($i, a, " ")
        if (a[2] == "red" && a[1] > 12 ||
            a[2] == "green" && a[1] > 13 ||
            a[2] == "blue" && a[1] > 14) next
    }
    t += $2
}
END { print t }
