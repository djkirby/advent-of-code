function pad(v, n) {
    return length(v) < n ? pad(0 v, n) : v;
}

function bin3(v, _r) {
    while (v) {
        _r = (v % 3) _r;
        v = int(v / 3);
    }
    return pad(_r, NF - 2);
}

BEGIN { FS = " |: " }
{
    for (i = 0; i < 3 ^ (NF - 2); i++) {
        s = $2
        split(bin3(i), a, "");
        for (j = 1; j <= length(a) && s <= $1; j++)
            s = !a[j] ? s * $(j + 2) : a[j] == 1 ? int(s $(j + 2)) : s + $(j + 2);
        if (s == $1) {
            t += $1;
            next;
        }
    }
}
END { print t }
