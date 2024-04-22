// https://leetcode.com/problems/ransom-note/description/
function canConstruct(ransomNote: string, magazine: string): boolean {
  if (!ransomNote && !magazine) return true;
  if (ransomNote && !magazine) return false;
  if (!ransomNote && magazine) return true;
  if (ransomNote.length > magazine.length) return false;


  let noteMap: Record<any, number> = {}
  for (const letter of ransomNote) {
    if (noteMap[letter]) {
      noteMap[letter]++
    } else {
      noteMap[letter] = 1
    }
  }

  for (const letter of magazine) {
    if (noteMap[letter] > 0) {
      noteMap[letter]--
    }

    if (noteMap[letter] === 0) {
      delete noteMap[letter]
    }

    if (Object.keys(noteMap).length < 1) {
      return true
    }
  }

  return false
};
