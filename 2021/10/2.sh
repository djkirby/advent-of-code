awk -f 2.awk input | sort -n | awk '{n[NR]=$1}END{print n[int(NR/2)+1]}'