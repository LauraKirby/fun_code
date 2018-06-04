# # square map of N rows,

# # The positions of ships are given as a string S,
# # containing pairs of positions describing respectively
# # the top-left and bottom-right corner cells of each ship.

# # Ships' descriptions are separated with commas.
# # The positions of hits are given as a string T,
# # containing positions describing the map cells that were hit:

# # for the map in the example shown above, S = "


# # Each row contains N cells,
# # labeled with consecutive English upper-case letters
# # Each cell is identified by a row (number) and column (letter)
# # Ex:
# #   - 9C denotes the third cell in the 9th row, and
# #   - 15D denotes the fourth cell in the 15th row.

# # Ships are marked on the map (which is not shown to Sonia).
# # Ships are rectangles with a maximum area of 4 cells.
# # Sonia picks map cells to hit some ships.

# # Return the number of sunk ships
# # and the number of ships that have been hit but not sunk.

# # n = size of map
# # s = top left and bottom right of ship positions, ships separated by comma
# # t = position of hits

# # Given N = 3, S = "1A 1B,2C 2C" and T = "1B",
# # because one ship was hit but not sunk.
# # => 0,1,

# def solution(n, s, t)
#   # create ships
#   ships = parse_and_create_ships(s)

#   # create map
#   sea_map = SeaMap.new(n, ships)



#   # add ships to "sea_map"

#   print sea_map.matrix
# end

# def parse_and_create_ships(ships_start_and_end)
#   ships = ships_start_and_end.split(',')
#   ships_start_and_end.each do |ship|
#     Ships.new(ship, max_ship_size)
#   end
# end

# class SeaMap
#   attr_reader :matrix

#   def initialize(map_size, ships=nil)
#     @size = map_size
#     @matrix = create_map(map_size)
#     @ships = ships
#   end

#   private

#   def create_map(n)
#     sea = []

#     char_num = 96
#     (0..@size).each.with_index do |row, i|
#       sea.push([])
#       (0..@size).each do |column|
#         char_val = [char_num += 1].pack 'U'
#         cell = Cell.new(i+1, char_val, false, false)
#         sea[i].push(cell)
#       end
#       char_num = 96
#     end
#     # return matrix
#     sea
#   end

# end

# class Cell
#   def initialize(row, column, ship, hit)
#     @row = row
#     @column = column
#     @ship = ship
#     @hit = hit
#   end
# end

# class Ship
#   # add class variable, since this will be true across all
#   # instances of ship
#   @@max_size = 4

#   def initialize(top_left, bottom_right)
#     @top_left = parse_coordinates(top_left)
#     @bottom_right = parse_coordinates(bottom_right)
#     @coordinates = calculate_coordinates
#   end

#   # there will be different shapes of ships
#   # if top_left[0] == bottom_right[0]
#     # long horizontal ship
#   # if top_left[0] + 1 == bottom_right[0]
#     # square ship
#   # if top_left[0] + 2 < bottom_right[0]
#     # long vertical ship


#   private

#   # there will be different shapes of ships
#   def calculate_coordinates
#     result = []

#     # rectangle horizontal ship
#     # Ex: 1a 1b 1c 1d
#     if top_left[0] == bottom_right[0]
#       calculate_horizontal_rectangle_coordinates

#     # square ship
#     # ex: 1a 1b 2a 2b
#     elsif top_left[0] + 1 == bottom_right[0]
#       calculate_square_coordinates

#     # rectangle horizontal ship
#     # Ex: 1a 1b 1c 1d
#     elsif top_left[0] + 2 < bottom_right[0]
#       # create long ship
#     else
#       puts "ship could not be created"
#     end
#     # 4 across
#   end

#   def parse_coordinates(string_coordinates)
#     [string_coordinates.split]
#   end

#   def calculate_square_coordinates
#     two = [@top_left[0], @top_left[1].ord.pack 'U')]
#     charm_num = @bottom_right[1].ord - 1
#     three = [@bottom_right[0], (charm_num].pack 'U')]
#     [@top_left, two, three @bottom_right]
#   end
# end

# n = 3
# s = "1B 2C,2D 4D"
# t = ""

# solution(n,s,t)