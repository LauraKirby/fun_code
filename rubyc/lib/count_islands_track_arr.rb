require 'byebug'
# assumes square

def count_islands(islands)
  # verify that we have an array of arrays
  return 0 if !islands[0] || !islands[0][0]
  # verify that map / matrix is a square
  return 0 if islands.length / islands[0].length != 1

  visited = []
  (islands.length).times { visited.push(Array.new(islands.length, false)) }
  puts "\n\ninitialized unvisited: #{visited}\n\n\n"
  count = 0

  islands.each_with_index do |row, i|
    puts "each_with_index: visited: #{visited}"
    # for row in islands
    for j in row
      if row[i][j] && !visited[i][j]
        dfs_check_for_land(islands, i, j, visited)
        count += 1
        puts "count: #{count}\n\n"
      end
    end
  end

  puts "islands: #{islands}"
  count
end

def dfs_check_for_land(islands, rw, col, visited)
  # locations to check
  nbr_rows = [-1, -1, -1, 0, 0, 1, 1, 1]
  nbr_columns = [-1,  0, 1, -1, 1, -1, 0, 1]

  # mark location as visited
  puts "visited[#{rw}][#{col}] = #{visited[rw][col]}"
  visited[rw][col] = true

  for i in nbr_rows
    # calculate location of neighbors
    nbr_row = rw + nbr_rows[i]
    nbr_column = col + nbr_columns[i]

    if check_current_location?(islands, nbr_row, nbr_column, visited)
      puts "check [#{nbr_row}, #{nbr_column}]"
      dfs_check_for_land(islands, nbr_row, nbr_column, visited)
      puts "dfs_check_for_land: visited: #{visited}"
    end
  end
end

def check_current_location?(islands, row, column, visited)
  valid_rows = row >= 0 && row < islands.length
  valid_columns = column >= 0 && column < islands.length
  valid_rows && valid_columns && islands[row][column] && !visited[row][column]
end

input = [
  [1, 0, 0, 1],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0]
]

# 1,1

# -1, 0
# 0, -1
# 0, 1
# 1, 0

# 0, 1
# 1, 0
# 1, 2
# 2, 1
count_islands(input)