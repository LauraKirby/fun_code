const getNeighbors = (row, column, visited) => {
  const neighbors = []
  // look up 
  // is in bounds, has not been visited
  if(row > 0 && !visited[row - 1][column]){
    neighbors.push([row - 1, column])
  }

  // look down
  // is in bounds, had not been visited
  if(row < visited.length - 1 && !visited[row + 1][column]) {
    neighbors.push([row + 1, column])
  }

  // look left
  if(column > 0 && !visited[row][column - 1]){
    neighbors.push([row, column - 1])
  }

  // look right
  if(column < visited[0].length - 1 && !visited[row][column + 1]){
    neighbors.push([row, column + 1])
  }

  return neighbors
}

const dfs = (row, column, grid, visited) => {
  const stack = [[row, column]]
  let isIsland = false
  
  while(stack.length){
    let [r,c] = stack.shift()

    if(grid[r][c] === '1' && !visited[r][c]){
      const neighbors = getNeighbors(r, c, visited)
      stack.push(...neighbors)
      isIsland = true
      visited[r][c] = true
    }
  }

  return isIsland
}

const numIslands = (grid) => {
  let islandCount = 0
  // get dimensions
  const rowCount = grid.length
  const colCount = grid[0].length

  // setup adjacent array to track visited
  const visited = grid.map(row => row.map(col => false))

  // iterate through each location in grid
  for(let row = 0; row < rowCount; row++){
    for(let col = 0; col < colCount; col++){
      if(dfs(row, col, grid, visited)){
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
