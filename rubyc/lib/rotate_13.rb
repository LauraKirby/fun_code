def skip_animals(animals, skip)
  # Your code here
  result = []
  skip = skip - 1
  animals.each_with_index do |animal, i|
    result.push("#{i}:#{animal}") if i > skip
  end
  result
end

# puts skip_animals(['fox', 'cow', 'zebra', 'tiger'], 2)


def rot13(secret_messages)
  secret_messages.each do |message|
    message.split("").map do |character|
      orginial_value = character.ord
      rotated_value = character.ord + 13
      if is_uppercase?(orginial_value)
        # if adding the rotation will put the letter out of bounds do an additional calculation
        if orginial_value > 87
          rotated_value = rotated_value - 90 + 64
          rotated_char = (rotated_value).chr
        else
          rotated_char = rotated_value.chr
        end
      elsif is_lowercase?(orginial_value)
        # if adding the rotation will put the letter out of bounds do an additional calculation
        if orginial_value > 109
          rotated_value = rotated_value - 122 + 96
          rotated_char = (rotated_value).chr
        else
          rotated_char = rotated_value.chr
        end
      end
      rotated_char
    end
  end
end

def is_lowercase?(orginial_value)
  # lowercase a - z, ordinal is between 97 - 122
  orginial_value > 64 && orginial_value < 91
end

def is_uppercase?(orginial_value)
  # uppercase A - Z, ordinal is between 65 - 90
  orginial_value > 64 && orginial_value < 91
end

def calculate_rotation(orginial_value)

end

# Why did the chicken cross the road
arr = %w(Jul, qvq, gur, puvpxra, pebff, gur, ebnq)
# arr = ['why']
# arr = ['jul']

puts rot13(arr)

# puts "j: #{'j'.ord}"
# puts "u: #{'u'.ord}"
# puts "l: #{'l'.ord}\n\n"

# puts "w: #{'w'.ord}"
# puts "h: #{'h'.ord}"
# puts "y: #{'y'.ord}\n\n"

# puts "z: #{'z'.ord}"
# puts "a: #{'a'.ord}"
# puts "A: #{'A'.ord}"
# puts "Z: #{'Z'.ord}"

# fashionmia.com
# To get to the other side!