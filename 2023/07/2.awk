function val(h, _v, _a) {
    split(h, _a, "")
    for (i = 1; i <= 5; i++) _v += v[_a[i]] * 100 ^ (5 - i)
    return _v
}

function five_kind(h) {
    return system("perl -le \"exit \\\"" h "\\\" =~ /(.).*\\1.*\\1.*\\1.*\\1/\"")
}

function four_kind(h) {
    return system("perl -le \"exit \\\"" h "\\\" =~ /(.).*\\1.*\\1.*\\1/\"")
}

function full_house(h) {
    return system("perl -le \"exit \\\"" h "\\\" =~ /(?=.*?(.)(?=.*?\\1.*?\\1))(?=.*?(?!\\1)(.)(?=.*?\\2))/\"")
}

function three_kind(h) {
    return system("perl -le \"exit \\\"" h "\\\" =~ /(.).*\\1.*\\1/\"")
}

function two_pair(h, n, a, pair2, found2) {
    return system("perl -le \"exit \\\"" h "\\\" =~ /(?=.*?(.)(?=.*?\\1))(?=.*?(?!\\1)(.)(?=.*?\\2))/\"")
}

function pair(h) {
    return system("perl -le \"exit \\\"" h "\\\" =~ /(.).*\\1/\"")
}

BEGIN {
    for (i = 2; i <= 9; i++) v[i] = i
    v["T"] = 10; v["J"] = 1; v["Q"] = 12; v["K"] = 13; v["A"] = 14
}
{
    z = $1
    jokers = gsub(/J/, "", z)
    if ((jokers == 1 && four_kind(z)) ||
        (jokers == 2 && three_kind(z)) ||
        (jokers == 3 && pair(z)) ||
        jokers == 4 ||
        five_kind($1)) { print 7, val($1), $0; next }
    if ((jokers == 1 && three_kind(z)) ||
        (jokers == 2 && pair(z)) ||
        (jokers == 3) ||
        four_kind($1)) { print 6, val($1), $0; next }
    if ((jokers == 1 && two_pair(z)) || full_house($1)) { print 5, val($1), $0; next }
    if ((jokers == 1 && pair(z)) ||
        (jokers == 2) ||
        three_kind($1)) { print 4, val($1), $0; next }
    if (two_pair($1)) { print 3, val($1), $0; next }
    if (jokers == 1 || pair($1)) { print 2, val($1), $0; next }
    print 1, val($1), $0
}
