/**
 * @param {string[]} votes
 * @return {string}
 */

//  Input: votes = ["WXYZ","XYZW"]
//  
//  create an object for each candidate
//  summary = {  
//      'A' = {
//          '0':5
//      },
//      'B' = {
//          '1':2
//      },
//      'C' = {
//          '1':6
//      }
//  }
// create a summary: iterate for the length of submissions
//      create an object for each candidate with their votes
// sort the summary: iterate for the length of canditates
//      check for who has the highest value for the first place
//      start with, if there is a tie, then push them both to the final output
//      next step: create a helper function to handle a tie
//          handleTie, has three arguments: candidateOne, candidateTwo, voteSummary
//              look at second key for each candidate, then look at who has the lowest key with the highest value
//              continue looking at each key until the tie is broken
//              if we reach the end of the keys, sort the candidates in alphabetical order
//              returns the correct order of the two candidates
//          

var rankTeams = function (votes) {
  const numberOfRankings = votes[0].length
  const summary = {}

  if (votes.length <= 1) {
    return votes.join('')
  }
  // ballots
  for (let i = 0; i < votes.length; i++) {
    // each ballot
    for (let j = 0; j < votes[i].length; j++) {
      // each candidate
      let candidate = votes[i][j]

      // summary contains candidate and at least one vote for this position
      if (summary[candidate] && summary[candidate][j]) {
        summary[candidate][j] += 1;
        // add first vote for this position
      } else if (summary[candidate]) {
        summary[candidate][j] = 1
        // add first summary for this candidate
      } else {
        summary[candidate] = {
          [j]: 1
        };
      }

    }
  }

  console.log('summary: ', summary)
  return calculateFinalPositions(summary, numberOfRankings)
};



var calculateFinalPositions = function (summary, numberOfRankings) {
  const finalScore = Object.keys(summary).sort((a, b) => {
    for (let i = 0; i < numberOfRankings; i++) {
      // Sort function compares two teams at a time. 
      // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort#description).
      // compare this team's score in this position with the next team's score in this position. 
      // if there's a clear winner, return -1 or 1, breaking the loop.

      // if the key and vallue pair do not exist, assign the result to 0, instead of undefined
      const currentValue = summary[a][i] ?? 0
      const nextValue = summary[b][i] ?? 0

      if (currentValue > nextValue) return -1;
      if (currentValue < nextValue) return 1;
      // if it's tied, the loop will continue to check the next position. 
    }
    // if the two teams are tied across all positions, compare team names.
    return a < b ? -1 : 1;
  }).join('');

  return finalScore
}


// // ----------------------------------------------
// // Test 1
// // ----------------------------------------------
// const votes1 = ["ABC", "ACB", "ABC", "ACB", "ACB"]
// const result1 = rankTeams(votes1)
// console.log('Test 1');
// console.log('expected result: ACB');
// console.log('actual result: ', result1, '\n\n')


// const votes2 = ["WXYZ", "XYZW"]
// // "XWYZ"

// const votes3 = ["ZMNAGUEDSJYLBOPHRQICWFXTVK"]
// "ZMNAGUEDSJYLBOPHRQICWFXTVK"

// Notes
//  option 1: store an array for each candidate
//  requires placeholders for locations where no votes were received
//  rankings = {
//      'X' = [1,0,0,0]
//      'Y' = [[][1][1][]]
//  }


// var rankTeams = function (votes) {

//   // if there's only one vote, return that vote
//   if (votes.length === 1) return votes[0];

//   // determine total number of teams and team names.
//   // note: votes[0] is used here, but it could be any vote
//   const teamNames = votes[0].split('');
//   const numberOfRanks = teamNames.length;

//   // Create a Map where each key is a team name 
//   // and each value is an array of integers.
//   // Ex: { 'A': [0,0,0,0], 'B': [0,0,0,0] }
//   // Here, the integers represent the total 
//   // number of votes each team received for a given rank. 
//   // The index of the array represents the rank (1st, 2nd, 3rd, etc). 


//   let teamScores = {}
//   for (tName in teamNames) {
//     teamKey = teamNames[tName]
//     teamScores[teamKey] = [0, 0, 0, 0]
//   }

//   // For each vote, iterate as many times are there are ranks
//   for (vote of votes) {
//     for (let i = 0; i < numberOfRanks; i++) {
//       // i is the rank/position (1st, 2nd, 3rd etc)
//       // find the team in teamScores and 
//       // increment the votes that it has received for this position
//       const teamName = vote[i];
//       const teamScore = teamScores[teamName];

//       teamScore[i]++;
//       // Ex: {'A': [1,0,0,0]}
//     }
//   }
//   // find an array of team names, 
//   return teamNames.sort((a, b) => {
//     for (let i = 0; i < teamNames.length; i++) {
//       // Sort function compares two teams at a time. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort#description).

//       // compare this team's score in this position with the next team's score in this position. 
//       // if there's a clear winner, return -1 or 1, breaking the loop.
//       if (teamScores[a][i] > teamScores[b][i]) return -1;
//       if (teamScores[a][i] < teamScores[b][i]) return 1;
//       // if it's tied, the loop will continue to check the next position. 

//     }
//     // if the two teams are tied across all positions, compare team names.
//     return a < b ? -1 : 1;
//   }).join('');
// };

const votes1 = ["ABC", "ACB", "ABC", "ACB", "ACB"]
const result1 = rankTeams(votes1)
console.log('Test 1');
console.log('expected result: ACB');
console.log('actual result: ', result1, '\n\n')


const votes2 = ["WXYZ", "XYZW"]
const result2 = rankTeams(votes2)
console.log('Test 2');
console.log('expected result: XWYZ');
console.log('actual result: ', result2, '\n\n')

const votes3 = ["ZMNAGUEDSJYLBOPHRQICWFXTVK"]
const result3 = rankTeams(votes3)
console.log('Test 3');
console.log('expected result: ZMNAGUEDSJYLBOPHRQICWFXTVK');
console.log('actual result: ', result3, '\n\n')
