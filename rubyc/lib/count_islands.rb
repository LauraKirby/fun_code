def num_islands(grid)
  count = 0
  puts "original grid: #{grid}"

  grid.each_with_index.map do |row, row_idx|
    row.each_with_index.map do |column_value, column_idx|
      puts "\n"
      puts "column_value: '#{column_value}'"
      if column_value == '1'
        # I am surprised that passing grid here is destructive of "grid" above
        clear_connected_land(grid, row_idx, column_idx)
        count += 1
      end
      puts "column_value: '#{column_value}'"
      puts "\n\n"
    end
    puts "grid, each row: #{row}, row_idx: #{row_idx}"
  end

  puts "final grid #{grid}"
  count
end

def clear_connected_land(grid, row_idx, column_idx)
  row_index_out_of_bounds = row_idx > grid.length - 1 || row_idx < 0
  column_index_out_of_bounds = column_idx > grid[0].length - 1 || column_idx < 0
  current_location_holds_water = row_index_out_of_bounds || grid[row_idx][column_idx] == '0'

  # break out of recursive call if any of the following are true
  if row_index_out_of_bounds || column_index_out_of_bounds || current_location_holds_water
    puts " --- pop call from stack: location grid[#{row_idx}][#{column_idx}]-----"
    return
  end

  # convert all connected "land" to "water"

  # set current location to "water"
  puts "current location grid[#{row_idx}][#{column_idx}] "
  grid[row_idx][column_idx] = '0'
  # check down by incrementing "row"
  puts "move down grid[#{row_idx + 1}][#{column_idx}]"
  clear_connected_land(grid, row_idx + 1, column_idx)
  # check up by decrementing "row"
  puts "move up grid[#{row_idx - 1}][#{column_idx}]"
  clear_connected_land(grid, row_idx - 1, column_idx)
  # check right by incrementing "column"
  puts "move right grid[#{row_idx}][#{column_idx + 1}]"
  clear_connected_land(grid, row_idx, column_idx + 1)
  # check left by decrementing "column"
  puts "move left grid[#{row_idx}][#{column_idx - 1}]"
  clear_connected_land(grid, row_idx, column_idx - 1)
end


input = [
          ['1','0'],
          ['1','0']
        ]

total = num_islands(input)
puts "total: #{total}"
