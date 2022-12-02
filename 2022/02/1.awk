/A X/ { s += 4 }
/A Y/ { s += 8 }
/A Z/ { s += 3 }
/B X/ { s++ }
/B Y/ { s += 5 }
/B Z/ { s += 9 }
/C X/ { s += 7 }
/C Y/ { s += 2 }
/C Z/ { s += 6 }
END { print s }