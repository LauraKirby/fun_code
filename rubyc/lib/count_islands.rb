# method: count_islands(input)
# result = []
# counter = 0
# first loop, iterate over rows
#   2nd loop, iterate over columns
#     if column value is 1
#       increment counter
#         and has_neighbor? is true
#           decrement counter
#
# return counter

# helper method: has_neighbor? (curent_position)
# return true if a 1 is located at north, south, east or west of current position

# Example:
# input = [
#           [0,0,1,0],
#           [0,0,1,0],
#           [0,1,0,0]
#         ]

# should return 2


def count_islands(input)
  count = 0
  input.each_with_index do |row, i|
    row.each_with_index do |column, j|
      if column == 1
        # puts "column equals 1, increase count"
        count += 1
        binding.pry
        if has_neighbor?(input, i, j)
          binding.pry
          # puts "column's neighbor equals 1, decrease count"
          count -= 1
        end
      end
    end
  end

  count
end



def has_neighbor?(input, x_coordinate, y_coordinate)
  # make sure +1/ -1 to y_coordinate will be in bounds
  if (x_coordinate > 1) && (x_coordinate < input.length - 1)
    # check if the value located in north is equal to 1
    if input[x_coordinate - 1][y_coordinate] == 1
      return true
    # check if the value located in south is equal to 1
    elsif input[x_coordinate + 1][y_coordinate] == 1
      return true
    end
  end

  # west & east
  if y_coordinate > 1 && y_coordinate < input[0].length - 1
    # check if the value located in west is equal to 1
    if input[x_coordinate][y_coordinate - 1] == 1
      return true
    # check if the value located in east is equal to 1
    elsif input[x_coordinate][y_coordinate + 1] == 1
      return true
    end
  end

  return false
end


input = [
          [1,1,1,1,0],
          [1,1,0,1,0],
          [1,1,0,0,0],
          [0,0,0,0,0]
        ]

count_islands(input)
