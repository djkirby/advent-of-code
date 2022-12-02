/A X/ { s += 3 }
/A Y/ { s += 4 }
/A Z/ { s += 8 }
/B X/ { s++ }
/B Y/ { s += 5 }
/B Z/ { s += 9 }
/C X/ { s += 2 }
/C Y/ { s += 6 }
/C Z/ { s += 7 }
END { print s }