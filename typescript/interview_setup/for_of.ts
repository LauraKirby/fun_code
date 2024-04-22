const ransomNote = 'we have your passwords'
let noteMap: Record<any, number> = {}

for (const letter of ransomNote) {
  if (noteMap[letter]) {
    noteMap[letter]++
  } else {
    noteMap[letter] = 1
  }
}


for (let step = 0; step < 5; step++) {
  // Runs 5 times, with values of step 0 through 4.
  console.log("Walking east one step");
}
