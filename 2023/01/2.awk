BEGIN { FS = "" }
{
    gsub(/one/, "o1e", $0)
    gsub(/two/, "t2o", $0)
    gsub(/three/, "t3e", $0)
    gsub(/four/, "f4r", $0)
    gsub(/five/, "f5e", $0)
    gsub(/six/, "s6x", $0)
    gsub(/seven/, "s7n", $0)
    gsub(/eight/, "e8t", $0)
    gsub(/nine/, "n9e", $0)
}
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
