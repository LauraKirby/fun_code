/*
nice solution: https://leetcode.com/problems/number-of-islands/solutions/3619981/bfs-dfs-dfs-iterative-queue-stack-recursion/

Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 

Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1
Example 2:

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
 

Constraints:

m == grid.length
n == grid[i].length
1 <= m, n <= 300
grid[i][j] is '0' or '1'.


Notes: 
  rows
      [
        > ["1","1","1","1","0"],
        > ["1","1","0","1","0"],
        > ["1","1","0","0","0"],
        > ["0","0","0","0","0"]
      ]

  columns
      [
          ["1","1","1","1","0"],
          ["1","1","0","1","0"],
          ["1","1","0","0","0"],
          ["0","0","0","0","0"]
            ^   ^   ^   ^   ^
      ]

  
*/
// DFS use a stack
// BFS use a queue

const getAdjecentNighbors = (row, column, visited) => {
  const neighbors = []
  // check up, 
  // if up is a valid location
  // and has not been visited
  if(row > 0 && !visited[row-1][column]){
    neighbors.push([row - 1, column])
  }

  // check down, 
  // if down is a valid location
  // and has not been visited
  if(row < visited.length - 1 && !visited[row + 1][column]) {
    neighbors.push([row + 1, column])
  }

  // check left:
  // if left is a valid location 
  // and has not been visited
  if(column > 0 && !visited[row][column - 1]){
    neighbors.push([row, column - 1])
  }

  // check right: 
  // if right is valid location
  // and has not been visited
  if(column < visited[0].length - 1 && !visited[row][column + 1]){
    neighbors.push([row, column + 1])
  }

  return neighbors
}

const dfs = (row,column, grid, visited) => {
  const stack = [[row, column]]
  let isIsland = false
  while(stack.length){
    // if current location is land
    // has not been visited
    let [r,c] = stack.shift()
    console.log('r: ', r, ' c: ', c)
    if(grid[r][c] === '1' && !visited[r][c]){
      const neighbors = getAdjecentNighbors(r, c, visited)
      stack.push(...neighbors)
      visited[r][c] = true
      isIsland = true
    }
  }

  return isIsland
}

var numIslands = function(grid){
  // setup dimensions
  const rowCount = grid.length
  const columnCount = grid[0].length
  const visited = grid.map(row => row.map(col => false))
  let islandCount = 0
  
  for(let row = 0; row < rowCount; row++){
    for(let column = 0; column < columnCount; column ++){
      // run dfs on location
      if(dfs(row, column, grid, visited)){
        islandCount++
      }
    }
  }

  return islandCount
}

const input1 = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]

const output1 = numIslands(input1)

console.log('expected: 1, actual: ', output1)



const input2 = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]

const output2 = numIslands(input2)

console.log('expected: 3, actual: ', output2)
