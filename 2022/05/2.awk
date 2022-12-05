/\[/ {
    gsub("    ","0")
    gsub(/[\[ \]]/, "")
    split($1, c, "")
    for (i = 1; i <= length($1); i++) 
        if (c[i]) a[i, l[i]++] = c[i]
}
/m/ {
    gsub(/move|from|to/, "")
    # move to tmp column
    for (i = 1; i <= $1; i++)
        for (e = 0; e < l[$2]; e++) {
            for (z = l[10]++; z > 0; z--) a[10, z] = a[10, z - 1]
            a[10, 0] = a[$2, e]
            for (z = 1; z < l[$2]; z++) a[$2, z - 1] = a[$2, z]
            delete a[$2, l[$2]--]
            break
        }
    # move from that tmp column to new column
    for (i = 1; i <= $1; i++) 
        for (e = 0; e < l[10]; e++) {
            for (z = l[$3]++; z > 0; z--) a[$3, z] = a[$3, z - 1]
            a[$3, 0] = a[10, e]
            for (z = 1; z < l[10]; z++) a[10, z - 1] = a[10, z]
            delete a[10, l[10]--]
            break
        }
}
END {
    for (i = 0; i <= length(c); i++) printf("%s", a[i,0])
    print ""
}