# 3 line solutions:
# using Ruby's range for characters

# # if casing is not required:
# def rot13(secret_messages)
#     secret_messages.map { |c| c.tr("a-z", "n-za-m") }
# end

# # if casing is required:
# def rot13(secret_messages)
#     secret_messages.map { |char| char.tr('A-Za-z', 'N-ZA-Mn-za-m') }
# end

def rot13(secret_messages)
  secret_messages.map { |word| rotate_letters(word) }
end

# lowercase a - z, ordinal is between 97 - 122
def is_lowercase?(orginial_value)
  orginial_value > 96 && orginial_value < 123
end

# uppercase A - Z, ordinal is between 65 - 90
def is_uppercase?(orginial_value)
  orginial_value > 64 && orginial_value < 91
end

def calculate_uppercase_rotation(orginial_value)
  rotated_value = orginial_value + 13
  # if adding the rotation will put the letter out of bounds do an additional calculation
  if orginial_value > 77
    rotated_value = rotated_value - 90 + 64
    rotated_char = rotated_value.chr
  else
    rotated_char = rotated_value.chr
  end
  rotated_char
end

def calculate_lowercase_rotation(orginial_value)
  rotated_value = orginial_value + 13
  # if adding the rotation will put the letter out of bounds do an additional calculation
  if orginial_value > 109
    rotated_value = rotated_value - 122 + 96
    rotated_char = (rotated_value).chr
  else
    rotated_char = rotated_value.chr
  end
  rotated_char
end

def rotate_letters(word)
  rotated_word = word.split("").map do |character|
    orginial_value = character.ord
    if is_uppercase?(orginial_value)
      calculate_uppercase_rotation(orginial_value)
    elsif is_lowercase?(orginial_value)
      calculate_lowercase_rotation(orginial_value)
    else # character is a symbol, and should not be rotated
      character
    end
  end
  rotated_word.join("")
end
