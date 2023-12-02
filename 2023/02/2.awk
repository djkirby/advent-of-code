BEGIN { FS = ", |: |; |Game " }
{
    r = g = b = 0
    for (i = 3; i <= NF; i++) {
        split($i, a, " ")
        if (a[2] == "red" && a[1] > r) r = a[1]
        if (a[2] == "green" && a[1] > g) g = a[1]
        if (a[2] == "blue" && a[1] > b) b = a[1]
    }
    t += r * g * b
}
END { print t }
