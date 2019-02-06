# implement a spreadsheet class

# With two functions
# GetValue() and SetValue()

# The inputs are a key, like A15 and a value for get
# And set is just a key

# test cases:
# invalid location: A0, must start at A1
# the highest letter to 'ordinal' permitted is 25

# set_value
# Example: A2
# x, horizontal row, 2 - 1
# y, vertical column, A.ord - 65 === 0

class Spreadsheet
  attr_accessor :grid

  def initialize()
    @grid = []
    @temporary_value
  end

  def get_value(input)
    @temporary_value = input
  end

  def set_value(key)
    column_row = key.split('')

    # 'A' will be converted to 0
    column = column_row[0].ord - 65
    row = column_row[1].to_i - 1

    # fill in missing rows
    if !@grid[row]
      # add sufficient columns for insert location
      while !@grid[row] do
        empty_row = [" "]
        @grid.push(empty_row)
      end
    end

    # find length of first row, which will match the rest of the rows
    row_column_length = @grid[0].length - 1

    if row_column_length < column
      # add sufficient columns for insert location
      while row_column_length < column
        @grid.each do | r |
          col = " "
          r.push(col)
        end
        row_column_length += 1
      end
    end

    @grid[row][column] = @temporary_value
  end
end

# create instance of Spreadsheet
s = Spreadsheet.new()
s.get_value("h")
s.set_value("A2")

s.get_value("b")
s.set_value("C4")

# print values in s
s.grid.each do |row|
  print row
  print "\n"
end

# [[], [], ["bye"], [], [], [], [], ["hi"]]

# [
#   [" ", " "]
#   [" ", " "]
#   [" ", "h"]
# ]
# [
#  [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "]
#  [" "], ["h"], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "]
#  [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "]
#  [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], [" "], ["b"]
# ]


