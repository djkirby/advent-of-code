sed 's/./&\n/g' $1 | grep . | awk -f 2.awk
