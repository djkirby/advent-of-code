awk -f 2.awk $1 | sort -k1,1n -k2,2n | awk '{t += $4 * NR}END{print t}'
