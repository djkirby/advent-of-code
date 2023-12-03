sed 's/./&\n/g' $1 | grep . | awk -f 1.awk
