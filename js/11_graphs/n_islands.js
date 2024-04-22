const getNeighbors = (row, column, visited) => {
  const neighbors = []
  
  // look up
  if(row > 0 && !visited[row - 1][column]){
    neighbors.push([row - 1, column])
  }
  
  // look down
  if(row < visited.length - 1 && !visited[row + 1][column]){
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
  // setup stack to track connected land
  const stack = [[row, column]]

  // initial return value for if an island was found
  let isIsland = false
  while(stack.length){
    let [r,c] = stack.pop()
    // if it is land, go get all neighbors
    // and it has not been visited
    if(grid[r][c] === '1' && !visited[r][c]){
      const neighbors = getNeighbors(r, c, visited)
      stack.push(...neighbors)
      visited[r][c] = true
      isIsland = true
    }
  }

  return isIsland
}

const numIslands = (grid) => {
  // setup visited 
  const visited = grid.map(row => row.map(column => false))
  
  // get dimensions
  const rowCount = grid.length
  const columnCount = grid[0].length

  // default return value
  let islandCount = 0
  
  // iterate through each cell of the grid
  for(let row = 0; row < rowCount; row++){
    for(let col = 0; col < columnCount; col ++){
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
