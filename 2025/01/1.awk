BEGIN { p = 50 }
{
    c = substr($0, 2)
    p = (p + (substr($0, 1, 1) == "R" ? c : 100 - c)) % 100
    n += !p
}
END { print n }
