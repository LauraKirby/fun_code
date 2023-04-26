class TextEditor {
  private leftOfCursor: string[] = []
  private rightOfCursor: string[] = []
  constructor() {

  }

  addText(text: string): void {
    for (let letter of text) {
      this.leftOfCursor.push(letter)
    }
  }

  deleteText(k: number): number {
    let numberOfDeletedLetters = 0
    console.log('\n\n\ndelete text: ', k)
    console.log('original left: ', this.leftOfCursor)
    console.log('original right: ', this.rightOfCursor)
    let deleted = 0;
    while (this.leftOfCursor.length && deleted < k) {
      this.leftOfCursor.pop()
      deleted++
    }

    console.log('after left: ', this.leftOfCursor)
    console.log('after right: ', this.rightOfCursor)
    console.log('returning: ', numberOfDeletedLetters)
    return deleted;
  }

  cursorLeft(k: number): string {
    let numberOfLettersMoved = 0
    console.log('\n\n\ncursor left: ', k)
    console.log('original left: ', this.leftOfCursor)
    console.log('original right: ', this.rightOfCursor)
    if (this.leftOfCursor.length === 0 && this.leftOfCursor.length < k) {
      let lengthOrTen = (this.leftOfCursor.length < 10) ? this.leftOfCursor.length : 10
      let tempOutput: string[] = []
      let rightLength = this.rightOfCursor.length

      while (lengthOrTen >= 0) {
        tempOutput.unshift(this.leftOfCursor[rightLength])
        rightLength--
        lengthOrTen--
      }

      console.log('after cursor left (left): ', this.leftOfCursor)
      console.log('after cursor left (right): ', this.rightOfCursor)
      console.log('returning: ', tempOutput.join(''))
      return tempOutput.join('')
    }

    while (this.leftOfCursor.length > 0 && numberOfLettersMoved < k) {
      const letterMoved: string | undefined = this.leftOfCursor.pop()
      if (letterMoved) {
        this.rightOfCursor.unshift(letterMoved)
      }

      numberOfLettersMoved++
    }
    console.log('after cursor left (left): ', this.leftOfCursor)
    console.log('after cursor left (right): ', this.rightOfCursor)
    console.log('returning: ', this.leftOfCursor.join(''))
    return this.leftOfCursor.join('')
  }

  cursorRight(k: number): string {
    let leftLength = this.leftOfCursor.length
    let moveOnRight = this.rightOfCursor.length

    if (moveOnRight < k) {
      let lengthOrTen = (this.leftOfCursor.length < 10) ? this.leftOfCursor.length : 10
      let tempOutput: string[] = []

      while (lengthOrTen >= 0) {
        tempOutput.unshift(this.leftOfCursor[leftLength])
        leftLength--
        lengthOrTen--
      }

      return tempOutput.join('')
    }


    while (k > 0) {
      const letterMoved = this.rightOfCursor.shift()
      if (letterMoved) {
        this.leftOfCursor.push(letterMoved)
      }

      k--
    }

    return this.leftOfCursor.join('')
  }
}

/**
* Your TextEditor object will be instantiated and called as such:
* var obj = new TextEditor()
* obj.addText(text)
* var param_2 = obj.deleteText(k)
* var param_3 = obj.cursorLeft(k)
* var param_4 = obj.cursorRight(k)
*/



// var obj = new TextEditor()
// let text = 'leetcode'
// obj.addText(text)

// let k = 4
// obj.deleteText(k)

// text = 'practice'
// console.log(obj.addText(text))

// k = 3
// console.log(obj.cursorRight(k))

// k = 8
// console.log(obj.cursorLeft(k))

// k = 10
// console.log(obj.deleteText(k))

// k = 2
// console.log(obj.cursorLeft(k))

// k = 6
// console.log(obj.cursorRight(k))

// ["TextEditor", "addText", "deleteText", "addText", "cursorRight", "cursorLeft", "deleteText", "cursorLeft", "cursorRight"]
// [[], ["leetcode"], [4], ["practice"], [3], [8], [10], [2], [6]]



// ["TextEditor", "addText", "cursorLeft", "cursorLeft", "addText", "deleteText"]
// [[], ["jxarid"], [5], [10], ["du"], [20]]
// expected: [null,null,"j","",null,2]

// var obj2 = new TextEditor()
// let text2 = 'jxarid'
// obj2.addText(text2)
// // => undefined

// let j = 5
// obj2.cursorLeft(j)
// // leftOfCursor = 'jxarid'
// // => j

// j = 10
// console.log(obj2.cursorLeft(j))
// // 
// // => jxarid

// text2 = 'du'
// console.log(obj2.addText(text2))

// j = 20
// console.log(obj2.deleteText(j))

// [  "1TextEditor","2addText","3deleteText","4addText","5cursorLeft","6addText",
//    "7deleteText","8addText","9cursorLeft","10deleteText"
// ]
// [[],["arnvmumatgmyw"],[5],["zrlufuifuy"],[2],["unh"],[20],["kwwp"],[6],[9]]
// 1TextEditor
var obj3 = new TextEditor()

// 2addText
obj3.addText('arnvmumatgmyw')
// => undefined

// 3deleteText
obj3.deleteText(5)
// leftOfCursor = 'arnvmuma'

// 4addText
obj3.addText('zrlufuifuy')
// left: arnvmumazrlufuifuy
// right: []

// 5cursorLeft
obj3.cursorLeft(2)
// => left: arnvmumazrlufuif
// right: uy

// 6addText
obj3.addText('unh')
// => left: arnvmumazrlufuifunh
// => right: uy

// 7deleteText
obj3.deleteText(20)
// 19

// 8addText
obj3.addText('kwwp')
// => left: arnvmumazrlufuifunhkwwp
// => right: uy
// => null

//5cursorLeft
obj3.cursorLeft(6)
// => left: arnvmumazrlufuifu
// => right: nhkwwpuy
// => arnvmumazrlufuifu

// 10deleteText
obj3.deleteText(9)
// 0

// Output
// [null,null,5,null,"arnvmumazrlufuif",null,19,null,"",0]

// Expected
// [null,null,5,null,"mazrlufuif",null,19,null,"",0]
