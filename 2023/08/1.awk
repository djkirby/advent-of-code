BEGIN { FS = "[(, )]" }
NR == 1 { for (i = 1; i <= split($0, a, ""); i++) instr[++instrs] = a[i] }
/=/ { a[NR] = $1; b[NR, "L"] = $4; b[NR, "R"] = $6; lines[$1] = NR }
END {
    l = lines["AAA"]
    s = a[l]
    while (++z) {
        s = b[l, instr[instr_idx + 1]]
        if (s == "ZZZ") { print z; exit }
        l = lines[s]
        instr_idx = ++instr_idx % instrs
    }
}
