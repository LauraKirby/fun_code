# count_islands.rb

# when i asked, how is working at Facebook, he responded with "It's work."


# method: count_islands
# 2 loops
# first loop, interate over rows
# 2nd loop, iterate over column
# if column value is 1 and current location does not has_neighbor? is false
#   push current location into result array
# return length of result array

# helper method: has_neighbor? (curent_position)
# return true if a 1 is located at north, south, east or west of current position


# method: count_islands(input)
# result = []
# first loop, iterate over rows
#   2nd loop, iterate over columns
#     if column value is 1
#       and has_neighbor? is false
#         push [row, column] into result

# return length of result array


# helper method: has_neighbor? (curent_position)
# return true if a 1 is located at north, south, east or west of current position

# return false

# input = [
#           [0,0,1,0],
#           [0,0,1,0],
#           [0,1,0,0]
#         ]

# should return 2

class IslandMap
  attr_accessor :count_islands, :matrix

  def initialize(matrix)
    @matrix = matrix
    @row_size = matrix.length
    @column_size = matrix[0].length
  end

  def count_islands
    result = @matrix
    count = 0
    result.each_with_index do |row, i|
      row.each_with_index do |column, j|
        if column == 1
          puts "column equals 1, increase count"
          count += 1
          if has_neighbor?(i, j) == true
            puts "true!!!!"
            count -= 1
          end
        end
        puts "i #{i}"
      end
    end

    count
  end


private
  def has_neighbor?(x_coordinate, y_coordinate)
    # north & south
    if (x_coordinate > 1) && (x_coordinate < @row_size - 1)
      if @matrix[x_coordinate - 1][y_coordinate] == 1
        puts "west true"
        return true
      elsif @matrix[x_coordinate + 1][y_coordinate] == 1
        puts "south true"
        return true
      end
    end

    # west & east
    if y_coordinate > 1 && y_coordinate < @column_size - 1
      if @matrix[x_coordinate][y_coordinate - 1] == 1
        puts "west true"
        return true
      elsif @matrix[x_coordinate][y_coordinate + 1] == 1
        puts "east true"
        return true
      end
    end

    puts "false"
    return false
  end

end


# input = [
#           [0,0,1,0],
#           [0,0,1,0],
#           [0,1,0,0]
#         ]

# total = IslandMap.new(input)

# result = total.count_islands

# puts result