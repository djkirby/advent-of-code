#!/bin/bash

rotate='
    BEGIN { FS = "" }
    { for (i = 1; i <= NF; i++) d[NR, i] = $i }
    END {
        for (i = NF; i >= 1; i--) {
            for (j = 1; j <= NR; j++) printf d[j, i];
            print ""
        }
    }
'

diags='
    BEGIN { FS = "" }
    { for (i = 1; i <= NF; i++) d[NR, i] = $i }
    END {
        for (x = 1; x <= NF; x++) {
            for (i = x; i <= NR; i++) {
                for (j = 1; j <= NF; j++) {
                    printf d[j, i];
                    i++;
                }
                print ""
            }
        }
        for (x = NF - 1; x >= 1; x--) {
            for (i = x; i >= 1; i--) {
                for (j = NF; j >= 1; j--) {
                    printf d[j, i];
                    i--;
                }
                print ""
            }
        }
    }
'

t=$(grep -o XMAS input | wc -l)
t=$((t + $(grep -o SAMX input | wc -l)))
t=$((t + $(awk "$diags" input | grep -o XMAS | wc -l)))
t=$((t + $(awk "$diags" input | grep -o SAMX | wc -l)))
t=$((t + $(awk "$rotate" input | grep -o XMAS | wc -l)))
t=$((t + $(awk "$rotate" input | awk "$diags" | grep -o XMAS | wc -l)))
t=$((t + $(awk "$rotate" input | grep -o SAMX | wc -l)))
t=$((t + $(awk "$rotate" input | awk "$diags" | grep -o SAMX | wc -l)))

echo $t
