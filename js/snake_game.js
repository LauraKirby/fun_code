// Design a Snake game that is played on a device with screen size height x width. 

// The snake is initially positioned at the top left corner (0, 0) with a length of 1 unit.

// You are given an array food where food[i] = (ri, ci) is the row and column 
// position of a piece of food that the snake can eat. When a snake eats a piece 
// of food, its length and the game's score both increase by 1.

// Each piece of food appears one by one on the screen, meaning the second piece 
// of food will not appear until the snake eats the first piece of food.

// When a piece of food appears on the screen, it is guaranteed that it will not 
// appear on a block occupied by the snake.

// The game is over if the snake goes out of bounds (hits a wall) or if its head 
// occupies a space that its body occupies after moving (i.e. a snake of length 
// 4 cannot run into itself).

// Implement the SnakeGame class:

// SnakeGame(int width, int height, int[][] food) Initializes the object with a 
// screen of size height x width and the positions of the food.
// int move(String direction) Returns the score of the game after 
// applying one direction move by the snake. If the game is over, return -1.



/**
 * @param {number} width
 * @param {number} height
 * @param {number[][]} food
 */
var SnakeGame = function (width, height, food) {
  this.maxRowWidth = width;
  this.maxColumnHeight = height;
  this.currentRow = 0;
  this.currenColumn = 0;
  this.food = food;
  this.foodFound = 0
  this.score = 0;
  this.bodyLength = 1;

  this.currentPosition = function () {
    return [this.currentRow, this.currenColumn];
  }

  this.directions = {
    'R': [0, 1],
    'L': [0. - 1],
    'U': [-1, 0],
    'D': [1, 0],
  }

  this.withinBoundary = function () {
    var rowOutOfBounds = this.currentRow > this.maxColumnHeight || this.currentRow < 0;
    var columnOutOfBounds = this.currentColumn > this.maxColumnHeight || this.currentColumn < 0;

    if (rowOutOfBounds || columnOutOfBounds) {
      console.log('snake hit a wall')
      return false
    }

    console.log('snake can continue')
    return true
  };

  this.checkForfoundFood = function () {
    console.log("checking for food")
    const foodExistsHere = this.currentRow == this.food[this.foodFound][0] && this.currenColumn == this.food[this.foodFound][1];
    if (foodExistsHere) {
      this.foodFound += 1;
      return true
    }

    return false
  };

  this.currentPosition = function () {
    return [this.currentRow, this.currenColumn]
  };
};

/** 
 * @param {string} direction
 * @return {number}
 */
SnakeGame.prototype.move = function (direction) {
  console.log('direction: ', direction)
  console.log('original posiiton: ', this.currentPosition())

  var addToCurrentPosition = this.directions[direction]
  console.log('addToCurrentPosition: ', addToCurrentPosition)
  this.currentRow += addToCurrentPosition[0]
  this.currentColumn += addToCurrentPosition[1]
  console.log('current position: ', this.currentPosition())

  if (this.withinBoundary()) {
    console.log('move failed: snake hit a wall')
    if (this.checkForfoundFood()) {
      console.log("food was found")
      // increment score 
      // increase body length
      this.score += 1;
      this.bodyLength += 1;
      return this.foundFood
    }
    return 0
  }
  return -1
};



/** 
 * Your SnakeGame object will be instantiated and called as such:
 * var obj = new SnakeGame(width, height, food)
 * var param_1 = obj.move(direction)
 */
var input2 = [[3, 2, [[1, 2], [0, 1]]], ["R"], ["D"], ["R"], ["U"], ["L"], ["U"]]
var width2 = input2[0][0]
var height2 = input2[0][1]
var food2 = input2[0][2]
var directions2 = [["R"], ["D"], ["R"], ["U"], ["L"], ["U"]]
let summary2 = []

var obj2 = new SnakeGame(width2, height2, food2)
for (i = 0; i < directions2.length; i++) {
  summary2.push(obj2.move(directions2[i]))
}

console.log('expected: [null,0,0,1,1,2,-1]')
console.log('actual: ', summary2)
