function pad(v, n) {
    return length(v) < n ? pad(0 v, n) : v;
}

function bin(v, _r) {
    while (v) {
        _r = (v % 2) _r;
        v = int(v / 2);
    }
    return pad(_r, NF - 2);
}

BEGIN { FS = " |: " }
{
    for (i = 0; i < 2 ^ (NF - 2); i++) {
        s = $2
        split(bin(i), a, "");
        for (j = 1; j <= length(a); j++)
            s = a[j] ? s * $(j + 2) : s + $(j + 2);
        if (s == $1) {
            t += $1;
            next;
        }
    }
}
END { print t }
