// What is the longest line in the file? Shortest line that is not blank?

import * as fs from 'fs';


const splitFile = (filePath: string): string[] => {
  const file = fs.readFileSync(filePath, 'utf8');

  const fileLines = file.split('\n')

  return fileLines
}

const countLines = (filePath: string): number => {
  const lines = splitFile(filePath)

  return lines.length
}

const highAndLow = (filePath: string): number[] => {
  const linesInAfile = splitFile(filePath)
  let longest = 0
  let shortest = 0

  for (let i = 0; i < linesInAfile.length; i++) {
    const trimmedLine = linesInAfile[i].trim().length
    const trimmedLongestLine = linesInAfile[longest].trim().length
    const trimmedShortestLine = linesInAfile[shortest].trim().length

    if (trimmedLine > trimmedLongestLine) {
      longest = i
    }

    const lineIsNotBlank = trimmedLine > 0
    const lineIsShorterThanShortest = trimmedLine < trimmedShortestLine

    if (lineIsShorterThanShortest && lineIsNotBlank) {
      shortest = i
    }
  }

  console.log(`the longest is: '${linesInAfile[longest]}'`)
  console.log(`the shortest is: '${linesInAfile[shortest]}'`)

  return [(longest + 1), (shortest + 1)]
}

console.log(countLines('/home/coderpad/data/rustc-dev-guide-getting-started.md'))

console.log(highAndLow('/home/coderpad/data/rustc-dev-guide-getting-started.md'))
// function that returns the number of lines in a file


// Object: [{key: string}: number]

// Record<any,string>

// future consideration, handle case of blank file
