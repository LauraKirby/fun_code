def sorted_merge(arr_a, arr_b, last_a, last_b)
  index_a = last_a - 1
  index_b = last_b - 1
  index_merged = last_b + last_a - 1

  # merge a and b, starting from the last element in each
  while index_b >= 0
    if index_a >= 0 && arr_a[index_a] > arr_b[index_b]
      # index_a = 2
      # 9 is bigger than 5 - comparing last to elements of the arrays
      # index_merged = 5
      # arr_1[5] = 9
      puts "A v ------------------------------"
      puts "index_merged: #{index_merged}"
      puts "index_a: #{index_a}"
      puts "arr_a[index_merged]: #{arr_a}[#{index_merged}]"
      puts "arr_a[index_a]: #{arr_a[index_a]}"
      arr_a[index_merged] = arr_a[index_a] # copy element
      index_a -= 1
      puts "new value arr_a[index_merged]: #{arr_a}[#{index_merged}] = #{arr_a[index_merged]}"
      puts "A ^ ------------------------------"
    else
      puts "B v ------------------------------"
      puts "index_merged: #{index_merged}"
      puts "index_b: #{index_b}"
      puts "arr_a[index_merged]: #{arr_a}[#{index_merged}]"
      puts "arr_b[index_b]: #{arr_b[index_b]}"
      arr_a[index_merged] = arr_b[index_b] # copy element
      index_b -= 1
      puts "new value arr_a[index_merged]: #{arr_a}[#{index_merged}] = #{arr_a[index_merged]}"
      puts "B ^ ------------------------------"
    end
    index_merged -= 1
  end
  print "arr_a length: #{arr_a.length} \n"
  print "#{arr_a} \n"
end

arr_1 = [2,5,9,10,12,18].sort!
arr_2 = [20,19,33,50,80,91].sort!

sorted_merge(arr_1, arr_2, arr_1.length, arr_2.length)
