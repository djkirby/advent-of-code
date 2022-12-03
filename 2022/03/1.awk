BEGIN { FS = "" }
{
    for (i = 1; i <= NF / 2; i++) s[NR, $i]++
    for (; i <= NF; i++) 
        if (s[NR, $i]) {
            t += index("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", $i)
            next
        }
}
END { print t }