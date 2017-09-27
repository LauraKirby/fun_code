# 1 | 1 2 3 4

# _________

# 2 | 2 4 6 8

# 3 | 3 6 9 12

# 4 | 4 8 12 16

def create_table(table_size)
  result = []
  (1..table_size).each_with_index do |initial_value, i|
    result.push([i+1])
    (1..table_size).each do |item|
      result[i].push(initial_value*item)
    end
  end

  result
end

def print_formatted_table(table)
  table.each_with_index do |arr, i|
    if i == 0
      print "\n\n#{arr[0]} | #{arr[1..-1]}\n"
      puts "--------------"
    else
      print "#{arr[0]} | #{arr[1..-1]}\n"
    end
  end


end

table_size = 4


table = create_table(table_size)

print table
print_formatted_table(table)