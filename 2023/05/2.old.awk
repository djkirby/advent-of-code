/seeds/ {
    for (i = 2; i < NF; i += 2) {
        x[++n] = $i
        y[n] = $(i + 1)
        print "seed group " (n) " " x[n] "-" x[n] + $(i + 1) - 1
    }
}
/^$/ {
    map = ""
    # n = 0
    idx = 0
}
map {
    ++idx
    print "\nline",idx, "-", $0 " - ranges from " $2 "-" ($2 + $3 - 1)
    for (i = 1; i <= n; i++) {
        # in range?
        print "\tchecking seed group " i, "(" x[i] "-" (x[i] + y[i] - 1) ")"

        if (mapped[maps, i]) {
            # print "\talready mapped"
        } else {
            # print "\tnot yet mapped"

            if (x[i] >= $2) {
                print "\t\tat least larger than or eq " $2

                if (x[i] <= $2 + $3 - 1) {
                    print "\t\tless than or eq the line's max of " ($2 + $3 - 1)

                    print "\t\tlowest seed dealing with is " x[i]

                    min = (x[i] + y[i] - 1) < ($2 + $3 - 1) ? (x[i] + y[i] - 1) : ($2 + $3 - 1)

                    print "\t\tmin of " (x[i] + y[i] - 1) " and "($2 + $3 - 1) " is " min

                    print "\t\t* so I know " x[i] "-" min " is mapped to: " $0

                    q=0
                    x[0] = x[i]
                    p = x[i]

                    for (k = x[i]; k <= min; k++) {
                        q++
                        w = ($1 - $2) + p + (q-1)
                        x[q] = w
                        # progress_percentage = int((k - x[i]) / (min - x[i] + 1) * 100);

                        print "\t\t" map "-q=" q "-" idx " x[" q "]=" w " -- progres= " progress_percentage "%"
                        mapped[maps,i]++
                        u=1
                    }

                    z[maps, i, 1] = $1
                    z[maps, i, 2] = $2
                    z[maps, i, 3] = $3

                    if (min < x[i] + y[i] - 1) {
                        print "\t\t!!!!!! more digits of this group to handle"
                    } else {
                        print "\t\tfull seed group handled"
                    }
                } else {
                    print "\t\tX out of range, greater than the max of " ($2 + $3 - 1)
                }
            } else {
                print "\t\tX out of range, too small"
            }
        }

        # if (s[i] >= $2 && s[i] <= $2 + $3 && !mapped[maps, i]) {
        #     diff = s[i] - $2
        #     print "diff", diff
        #     s[i] = $1 + diff
        #     mapped[maps, i] = 1
        # }
        # print "setting s[" i "] = " s[i]
    }
}
/map/ {
    map = ++maps
    # if (map == 3)exit
    print "\n\nmap",map

}
END {
    min = s[1]
    for (i = 1; i <= seeds; i++)
        min = s[i] < min ? s[i] : min
    print min
}

# Seed 14, soil 14, fertilizer 53, water 49, light 42, temperature 42, humidity 43, location 43.
