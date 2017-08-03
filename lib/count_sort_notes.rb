# Consider an object that contains a 10 bit integer, and a string.
# Sort a 10 million array of such objects by the integer
# (don’t care for the string sorting)  where each object is
# (10bit integer and a string) in place using 0(1) extra
# memory and in O(n) time complexity

# 10 bit integer ==> 0-1023
# object.integer_value
# input   [obj_val_7, obj_val_4, obj_val_2, obj_val_1]
# output  [obj_val_1, obj_val_2, obj_val_4, obj_val_7]

# size complexity: O(n + k)
# n is the input array size
# k represents the value options (0-1023)

# time complexity is the same of size complexity, O(n + k)

# rework the piece of code below to use shuffle sort and decrease the amount of space needed for solution.
  # propagate result array with sorted values.
  # input_arr.length.times do |i|
  #   nums_count_arr[input_arr[i].int_value] -= 1
  #   result[nums_count_arr[input_arr[i].int_value]] = input_arr[i]
  #   count+=1
  # end

class Container
  attr_accessor :int_value, :name

  def initialize(int_value, name="abc")
    @int_value = int_value
    @name = name
  end
end

# input_arr = []

# 5.times do
#   input_arr.push(Container.new(rand(0..1023), "abcd"))
# end



a = Container.new(1)
b = Container.new(4)
c = Container.new(1)
d = Container.new(2)
e = Container.new(7)
f = Container.new(5)
g = Container.new(2)

input_arr = [a,b,c,d,e,f,g]

def sort_array(input_arr)
  max = 9
  nums_count_arr = Array.new(max + 1, 0)
  h = Container.new(0)
  result = Array.new(input_arr.size, h)

  return false if input_arr.length == 0
  return input_arr if input_arr.length == 1 && input_arr[0].int_value >= 0 && input_arr[0].int_value <= max

  # count the number of times each value appears.
  input_arr.each do |val|
    return false if val.int_value > max || val.int_value < 0
    nums_count_arr[val.int_value] += 1
  end
puts "\n\n---------------"
  # calculate the position of each object for the result array.
  # store the sum of the previous counts in each element of the nums_count_arr.
  print "nums_count_arr: "
  nums_count_arr.length.times do |i|
    nums_count_arr[i] = nums_count_arr[i] + nums_count_arr[i - 1]
    print " #{nums_count_arr[i]}, "
  end
puts "\n---------------"
  # propagate result array with sorted values.
  puts "\n"
  count = 0
  input_arr.length.times do |i|
    puts "\n\n---------------"
    puts "count: #{count}"
    puts "---------------\n\n"
    puts "\ni = #{i}\n\nStep A: nums_count[input_arr[i].int_value] -= 1 \n\n"

    puts "1. find the value of input_arr for current index 'i'
    input_arr[i].int_value
    input_arr[#{i}].int_value = #{input_arr[i].int_value}\n\n"

    puts "2. take the value above and use it as the index for 'nums_count_arr'
    nums_count_arr[input_arr[#{input_arr[i].int_value}].int_value]
    nums_count_arr[#{input_arr[i].int_value}] = nums_count_arr[input_arr[i].int_value]
    nums_count_arr[#{input_arr[i].int_value}] = nums_count_arr[input_arr[#{i}].int_value]
    nums_count_arr[#{input_arr[i].int_value}] = nums_count_arr[#{input_arr[i].int_value}]
    nums_count_arr[#{input_arr[i].int_value}] = #{ nums_count_arr[input_arr[i].int_value]}\n\n"

    puts "3. subtract 1 from the value of nums_count_arr[#{input_arr[i].int_value}]
    #{ nums_count_arr[input_arr[i].int_value] } - 1 = #{ nums_count_arr[input_arr[i].int_value] - 1}
    nums_count_arr[#{input_arr[i].int_value}] = #{nums_count_arr[input_arr[i].int_value] - 1}\n\n"

    nums_count_arr[input_arr[i].int_value] -= 1

    puts "Step B: result[nums_count_arr[input_arr[i].int_value]] = input_arr[i]\n\n"

    puts "4. use nums_count_arr as the index to store the value of input_arr into 'result'
    nums_count_arr[input_arr[i].int_value]"

    puts "5. nums_count_arr[#{input_arr[i].int_value}] = input_arr[i]
    nums_count_arr[#{input_arr[i].int_value}] = #{input_arr[i].int_value} \n\n"


    result[nums_count_arr[input_arr[i].int_value]] = input_arr[i]
    count += 1
    print "    nums_count_arr:"
    nums_count_arr.each do |num|
      print " #{num}, "
    end

    print "\n    result array:"
    result.each_with_index do |obj, index|
      if index == i
        print " ->"
      end
      print " #{obj.int_value} "
            if index == i
        print "<- "
      end
    end

    puts "\n\n---------------"
  end
  print "\n\nsorted list:"
  result.each do |obj|
    print " #{obj.int_value} "
  end
  print "\n\n"
  return result

end

# sort_array(input_arr)