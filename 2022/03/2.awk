BEGIN { FS = "" }
NR % 3 { for (i = 1; i <= NF; i++) s[NR, $i]++ }
!(NR % 3) {
    for (i = 1; i <= NF; i++) 
        if (s[NR - 1, $i] && s[NR - 2, $i]) {
            t += index("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", $i)
            next
        }
}
END { print t }