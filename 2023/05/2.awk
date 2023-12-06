/seeds/ {
    totalSeeds = 0
    for (i = 2; i < NF; i += 2) {
        totalSeeds += $(i + 1)
    }

    currentSeed = 0
    for (i = 2; i < NF; i += 2) {
        for (j = $i; j < $i + $(i + 1); j++) {
            currentSeed++
            progress = (currentSeed / totalSeeds) * 100
            print j, "Progress:", progress "%"
        }
    }
}
