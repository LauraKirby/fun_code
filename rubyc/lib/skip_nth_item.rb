def skip_animals(animals, skip)
  result = []
  skip = skip - 1
  animals.each_with_index do |animal, i|
    result.push("#{i+1}:#{animal}") if i > skip
  end
  result
end

# puts skip_animals(['fox', 'cow', 'zebra', 'tiger'], 2)