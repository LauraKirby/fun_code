# ---------------------------------------
# Part 1
# ---------------------------------------
# Imagine we have an image.
# We’ll represent this image as a simple 2D array where
# every pixel is a 1 or a 0. The image you get is known
# to have a single rectangle of 0s on a background of 1s.
# Write a function that takes in the image and returns
# the coordinates of the rectangle -- either top-left and
# bottom-right; or top-left, width, and height.

image = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 0, 0, 0, 1],
  [1, 1, 1, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1],
];

image2 = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 0, 0, 1, 1],
  [1, 1, 1, 0, 0, 1, 1],
  [1, 1, 1, 0, 0, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
];
# 1,3
# 3,5

image3 = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 0, 0],
  [1, 1, 1, 1, 1, 0, 0],
  [1, 1, 1, 1, 1, 0, 0],
  [1, 1, 1, 1, 1, 0, 0],
];
# 1,5
# 3,6

# iterate over 2-d array and find first 0
# top_left - store coordinates
#   height: 1
# if value != 1
#   increment the width
# in next array has 0 at same 2nd coordinate
#   increase height by 1

# ---------------------------------------
# Part 2
# ---------------------------------------
# The image you get is known to have N rectangles
# of 0's on a background of 1's. Write a function
# that takes in the image and outputs the coordinates
# of all the 0 rectangles.

# arr of hashes, one hash for rectangle
# track number of rectangles
  # if encounter 0 update rectangle count
  # if next value != 0, store width
  # if index remains the same, if encounter 0
# which will tell us which rectangle to update
# add to hash, end of first line of rectangle
# move to next arr, if encounter 0
# For example:

# Find top left
# we will know that it is a new top left
# if value above current location is 1
#   [curr_x, curr_y] + [-1, 0] contains the value of 1
# or
# if value to the left of the current location is 1
#   if [curr_x, curr_y] + [0, -1] contains the value of 1


image4 = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 0, 0, 0, 1],
  [1, 0, 1, 0, 0, 0, 1],
  [1, 0, 1, 1, 1, 1, 1],
  [1, 0, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
];

# width

# rectangles[0][top_right][1]
# {top_left: [2, 3], top_right: [2,5], width:  bottom_right: [3, 5]},
# {top_left: [3, 1], top_right: [3,1], bottom_right: [5, 1]},

# tests
# check input type
# rotate image and test code



def rectangleLocation(input)
  rectangle = {
                top_left: [0,0],
                width: 1,
                height: 1,
                bottom_right:[]
              }

  bottom_right = bottom_right

  top_lefts = []
  number_of_rectangles = 0
  rectangles = []
  temp_rectangle = {}

  input.each_with_index do |arr, i|

    height = 0
    arr.each_with_index do |item, k|
      width = 0

      coord_left = rectangle[:top_left][0] + 1
      coord_up = rectangle[:top_left][1] + 1

      if (item == 0 && arr[coord_left] == 1 && arr[coord_up] == 1)
        new_rectangle = {
                          top_left: [i, k],
                          width: 1,
                          height: 1,
                          bottom_right:[]
                        }
        rectangles.push(new_rectangle)
      elsif (item == 0 && arr[k] != arr[k+1])
        bottom_right = [i, k]
        width += 1
      end
      rectangle[:width] = width
      rectangle[:height] = height
    end


    # if rectangle[top_left]
    number_of_rectangles += 1


    if (rectangles.length < 1)
      # rectangles.push(rectangle)
    else
      rectangles.each do |rectangle|
        if (rectangle[:top_left] != rectangle[:top_left])
          # rectangles.push(rectangle)
        end
      end
    end

  end
  rectangles
end

puts rectangleLocation(image4)

