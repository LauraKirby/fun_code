require 'byebug'
# [{a:1,b:2},{a:2}, {a:5,b:0}]
# if the key is a, return {a:1,b:2}
# 'asc' find the max value
# 'desc' find the min value
# if value for given key is not present, the default value is 0

def find_dictionary_value_by_rank(input, rank)
  # iterate through all values
  # store lowest value and index of dictionary where value was found

  # if value for key is missing, set it to 0
  result_value = input[0].values[0] ? input[0].values[0] : 0

  result_details = {
    current_value: result_value,
    result_value: result_value,
    dictionary_index: 0,
    rank: rank
  }

  input.each_with_index do |element, i|

    element.each do |k, mv|
      # if value for key is missing, set it to 0
      mv = 0 if mv == nil
      result_details[:current_value] = mv

      # find minimum value or maximum value
      if rank_desc?(result_details) || rank_asc?(result_details)
        result_details[:result_value] = mv
        result_details[:dictionary_index] = i
      end
    end

  end

  return input[result_details[:dictionary_index]]
end


def rank_desc?(details)
  return true if details[:current_value] < details[:result_value] && details[:rank] == 'desc'
end


def rank_asc?(details)
  return true if details[:current_value] > details[:result_value] && details[:rank] == 'asc'
end

input = [{a:1,b:7},{a:2}, {a:5,b:0}, {a:2}]
rank = 'asc'

puts rank
puts find_dictionary_value_by_rank(input, rank)

puts "\n\n"

rank = 'desc'
puts rank
puts find_dictionary_value_by_rank(input, rank)

puts "\n\n"

input = [{a:nil,b:7},{a:2}, {a:5,b:1}, {a:2}]
rank = 'desc'
puts rank
puts find_dictionary_value_by_rank(input, rank)