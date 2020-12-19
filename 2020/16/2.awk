function validTicket() {
  for (col = 1; col <= NF; col++)
    if (!validValue[$col]) return 0;
  return 1;
}

function processNotes() {
  for (i = $2; i <= $3; i++) {
    valid[$1][i]++; 
    validValue[i]++;
  } 
  for (i = $4; i <= $5; i++) {
    valid[$1][i]++; 
    validValue[i]++
  }
}

function processMyTicket() {
  for (col = 1; col <= NF; col++) myTicket[col] = $col;
}

function processNearbyTickets() {
  for (col = 1; col <= NF; col++) {
    nearby[col][$col]++;
    for (note in valid) 
      if (!valid[note][$col]) 
        bad[col][note]++;
  }
}

function determinePossibleMappings() {
  for (col = 1; col <= NF; col++) {
    for (note in valid) {
      found = 0;
      if (length(bad[col]))
        for (other in bad[col]) {
          if (note == other) {
            found++;
            break;
          }
        }
      if (!found) 
        possibilities[col][note]++;
    }
  }
}

function determineMappings() {
  while (mapped < NF) {
    for (col = 1; col <= NF; col++) {
      if (!mapping[col] && length(possibilities[col]) == 1) {
        for (note in possibilities[col]) {
          mapping[col] = note;
          break;
        }
        for (j = 1; j <= NF; j++) 
          if (j != i) 
            delete possibilities[j][note]
        mapped++;
      }
    }
  }
}

function getNumber() {
  num = 1;
  for (col in mapping) 
    if (mapping[col] ~ /^departure/)
      num *= myTicket[col];
  return num;
}

BEGIN { FS = "[,-]| or |: "; }
/-/ { processNotes(); }
/,/ && !n++ { processMyTicket(); }
/,/ && n && validTicket() { processNearbyTickets(); }
END {  
  determinePossibleMappings();
  determineMappings();
  print getNumber();
}