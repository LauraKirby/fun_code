def find_max(nums)
  # what is the possible lowest value
  max = 0

  nums.each do |num|
    max = num if max < num
  end

  max
end

# max = find_max([1,2,3,4,1,2,3])
# puts "max: #{max}"
