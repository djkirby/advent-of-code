BEGIN { FS = "[(, )]" }
NR == 1 { for (i = 1; i <= split($0, a, ""); i++) instr[++instrs] = a[i] }
/=/ { a[NR] = $1; b[NR, "L"] = $4; b[NR, "R"] = $6; lines[$1] = NR }
/A =/ { r[++rs] = NR }
END {
    link = "https://www.wolframalpha.com/input?i=lcm"
    while (++z) {
        for (i = 1; i <= rs; i++) {
            next_source = b[r[i], instr[instr_idx + 1]]
            if (next_source ~ /Z$/) {
                link = link "+" z
                if (++n == rs) { print link; exit }
            }
            r[i] = lines[next_source]
        }
        instr_idx = ++instr_idx % instrs
    }
}
