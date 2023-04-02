// Constraints:

// 1 <= strs.length <= 104
// 0 <= strs[i].length <= 100
// strs[i] consists of lowercase English letters.

/**
 * @param {string[]} strs
 * @return {string[][]}
 */
var groupAnagrams = function (strs) {
  if (strs.length == 1) {
    return [strs]
  }

  const result = []
  result.push([strs.pop()])

  // iterate over each anagram
  for (let i = 0; i < strs.length; i++) {
    const temporaryAnagram = strs[i];
    // check if temporary anagram matches any of the existing anagrams within 'result'
    let wordPlaced = false
    for (let j = 0; j < result.length; j++) {
      const existingAnagram = result[j][0]
      const matchFound = wordsMatch(existingAnagram, temporaryAnagram)

      if (matchFound) {
        // if a match was found, add the temporary anagram to current group
        wordPlaced = true
        result[j].push(temporaryAnagram)
      }
    }

    if (!wordPlaced) {
      result.push([temporaryAnagram])
    }


  }

  return result
};

var wordsMatch = function (firstWord, secondWord) {
  const firstSorted = firstWord.split("").sort().join("")
  const secondSorted = secondWord.split("").sort().join("")

  return firstSorted == secondSorted
}

// --- when: there is one empty string in the list
// ------- return the empty string in an embeded array
const input1 = [""]
const expectedOutput1 = [[""]]
const result1 = groupAnagrams(input1)
console.log('Test 1');
console.log('expected result: ', expectedOutput1);
console.log('actual result: ', result1, '\n\n')


// // --- when: there is one letter in the list
// // ------- return the empty string in an embeded array
const input2 = ["a"]
const expectedOutput2 = [["a"]]
const result2 = groupAnagrams(input2)
console.log('Test 2');
console.log('expected result: ', expectedOutput2);
console.log('actual result: ', result2, '\n\n')


// --- when: anagram appears more than once
// ------- group anagrams
const input3 = ["eat", "tea", "tan", "ate", "nat", "bat"]
const expectedOutput3 = [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]
const result3 = groupAnagrams(input3)
console.log('Test 3');
console.log('expected result: ', expectedOutput3);
console.log('actual result: ', result3, '\n\n')
