BEGIN { RS = ","; FS="-" }
{ for (i = $1; i <= $2; i++) n += substr(i, 1, length(i) / 2) == substr(i, length(i) / 2 + 1) ? i : 0 }
END { print n }
