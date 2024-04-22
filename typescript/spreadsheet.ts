// Schedule:
// 5 min - Introductions
// 35 min - Coding Exercise
// 5 min - Questions for Affinity

// Part 0:
// 1. Tip: Talk out loud while solving the problem(s).
// 2. You can use Google to search for syntax, etc..
// 3. Choose your favorite language on top-left.
// 4. Click "Run” on top-left.

/*

Roadmap: There are NO trick questions =) We’re looking for:
* Clean code design & abstraction
* Tradeoffs considered (so please be sure to talk through the decisions you make)
* Communication
* Test cases / edge cases (you can always assume well-formed input)
* You are allowed to reference API documentation for your language

Part 1:
Implement a spreadsheet where cells need to support string values like “Sunday” and “10”.
Cell locations are identified by "A1" or "C3".
You can assume at most 26 columns, namely A to Z, but no bounds exist for the number of rows. You can assume all input to the API will be valid.

Using in-memory structure(s), implement an API to: 
  A. Set a cell value. Accepts a string value and a cell location.
  B. Get a cell value. Accepts a cell location. Returns a string value.

Example:
```
   | A        | B        | ... | Z        |
-------------------------------------------
1  | 'Sunday' |          | ... |          |
2  |          | 'Banana' | ... |          |
...
```

Part 2:
Implement the ability to enter formulas into cells. 
You can assume simple expressions of the form "= 10 + 23 - 2" and only integer operands. There will always be a single space between an operator and an operand.
You only need to support +/- and you can assume a left-to-right order of evaluation.

*/

const { expect } = require('chai');

class Spreadsheet {
  data: Record<any, string> = {}

  constructor() {

  }

  setValue = (location: string, value: string): boolean => {
    if (this.isExpression(value)) {

    }


    this.data[location] = value

    if (this.data[location]) {
      return true
    }

    return false
  }

  getValue = (location: string): string => {
    if (this.data[location]) {
      return this.data[location]
    }
    return ''
  }

  isExpression = (value: string): boolean => {
    if (value.charAt(0) === '=') {
      return true
    }
    return false
  }

  calculateExpression = (value: string): string => {
    // split on string 
    // = 10 + 23 - 2
    // [10, +, 23, - ,2]
    // total, first item in array
    // temp operand 
    // iterate through array 
    //  index odd is number
    //  number 
    //  how convert string operand to a JS operand 
    // 
    return 'hi'
  }
}

const starterSpreedsheet = new Spreadsheet()

expect(starterSpreedsheet.setValue('A1', '2')).to.equal(true)
// describe .validateLocation

// describe .setValue
// describe: validate location
// describe: validate column
// describe: invalid location
// describe: non-aphabetical character
// describe: valid location
// describe: uppercase  aphabetical character
// describe: lowercase aphabetical character
// describe: validate row

// describe: validate value
// describe: valid value
// describe: a string is added to the cell
// describe: ingvalid value
// describe: an object is added to the cell

// describe .getValue

expect(starterSpreedsheet.setValue('b1', '2')).to.equal(true)
expect(starterSpreedsheet.setValue('bb1', '2')).to.equal(true)
expect(starterSpreedsheet.getValue('A1')).to.equal('2')


expect(starterSpreedsheet.setValue('A1', "= 10 + 23 - 2")).to.equal('31')

console.log('finished program')

