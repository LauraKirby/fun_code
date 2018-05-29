# You are arranging images on the home page of a major website! You have a list of images in this format:

#   [{'width': 300, 'height': 300, 'src': 'puppy.jpg'},
#    {'width': 200, 'height': 500, 'src': 'kitty.png'}]


# Your job is to organize these images into spaced rows.
# Given a page width and row height, scale each image so that it is exactly as tall as the row,
# and maintains its aspect ratio.

# Then add each image into an array of rows, such that the total row width does not exceed the given page width.
# If an image can't fit within a given row, it should be added to the next row instead.
# You won't need to re-order the images.

# Your function should have the following signature:

#   make_into_rows(images, page_width, row_height)

# See the following an example call and correct results for a page width of 220, and a row height of 40.

# images = [
#   {'width': 100, 'height': 80, 'src': 'kitty1.jpg'},
#   {'width': 10,  'height': 20, 'src': 'kitty2.jpg'},
#   {'width': 150, 'height': 60, 'src': 'kitty3.jpg'},
#   {'width': 10,  'height': 5, 'src': 'kitty4.jpg'},
#   {'width': 40,  'height': 20, 'src': 'kitty5.jpg'},
#   {'width': 60,  'height': 40, 'src': 'kitty6.jpg'}]

# make_into_rows(images, 220, 40)
# [
#   [

#     {'width': 50,  'height': 40, 'src': 'kitty1.jpg'},
#     {'width': 20,  'height': 40, 'src': 'kitty2.jpg'},
#     {'width': 100, 'height': 40, 'src': 'kitty3.jpg'}
#   ], [
#     {'width': 80,  'height': 40, 'src': 'kitty4.jpg'},
#     {'width': 80,  'height': 40, 'src': 'kitty5.jpg'},
#     {'width': 60,  'height': 40, 'src': 'kitty6.jpg'}
#   ]
# ]

# You can assume:
# - 'images' is a native array of objects in your chosen language.
# - Each image has positive integer height and widths.
# - No image is wider than the given page width.

# update height to 40
# check if image is 200
  # - if yes, create new array
  # - if no, add width or current image and previous
    # check if image is 200 or under

# make_into_rows(images, 220, 40)

def make_into_rows(images, page_width, row_height)
  result = []
  temp_images = []

  images.each do |image|
    if image[:height] != row_height
      # update the image height and width based upon the
      # ratio of row_height to image height
      update_image_dimensions(row_height, image)
    end

    # create a temporary array which will be emptied out each time the sum
    # of the images' width is equal to or greater than the "page_width"
    temp_images.push(image)
    total_width = calculate_width(temp_images)

    if total_width == page_width
      result.push(temp_images)
      temp_images = []
      temp_images.push(image)
    elsif total_width > page_width
      result.push(temp_images[0..temp_images.length - 2])
      temp_images = []
      temp_images.push(image)
    end
  end

  print result
  result
end

def calculate_width(images)
  sum = 0
  images.each do |image|
    sum += image[:width]
  end
  sum
end

def update_image_dimensions(preferred_height, image)
  ratio = preferred_height.to_f / image[:height].to_f
  image[:width] = (image[:width] * ratio).truncate
  image[:height] = (image[:height] * ratio).truncate
end

images =   [
              {width: 100, height: 80, src: 'kitty1.jpg'},
              {width: 10,  height: 20, src: 'kitty2.jpg'},
              {width: 150, height: 60, src: 'kitty3.jpg'},
              {width: 10,  height: 5,  src: 'kitty4.jpg'},
              {width: 40,  height: 20, src: 'kitty5.jpg'},
              {width: 60,  height: 40, src: 'kitty6.jpg'}
            ]

make_into_rows(images, 220, 40)
