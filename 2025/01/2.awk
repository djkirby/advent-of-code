BEGIN { p = 50 }
{
    for (i = 0; i < int(substr($0, 2)); i++) {
        p += substr($0, 1, 1) == "R" ? 1 : -1
        p = p < 0 ? 99 : p % 100
        n += !p
    }
}
END { print n }
