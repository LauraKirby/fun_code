/**
 * @param {string[]} strs
 * @return {string}
 */
const longestCommonPrefix = function longestCommonPrefix(strs) {
  // find shortest word, this is the most that we will ever too to look
  // iterate over each word
  // if all words match the current letter, then add the letter to the output
  // if there is a mismatch, then return the output
  const shortestWord = Math.min(...(strs.map((str) => str.length)));
  console.log(`shortest word: ${shortestWord}`);
  let currentIndex = 0;
  const firstWord = strs[0];
  let longestPrefix = '';

  while (currentIndex < shortestWord - 1) {
    let currentLetter;

    for (let i = 0; i < strs.length; i += 1) {
      console.log(`longestPrefix: ${longestPrefix}`);
      const currentWord = strs[i];
      console.log(`currentWord: ${currentWord}`);
      currentLetter = currentWord[currentIndex];
      console.log(`currentLetter: ${currentLetter}`);

      if (currentWord[currentIndex] !== firstWord[currentIndex]) {
        return longestPrefix;
      }
    }

    longestPrefix += currentLetter;
    currentIndex += 1;
  }
  return longestPrefix;
};

const strs = ['flower', 'flow', 'flight'];
console.log(longestCommonPrefix(strs));

// strs = ['dog', 'racecar', 'car'];
// console.log(longestCommonPrefix(strs));
