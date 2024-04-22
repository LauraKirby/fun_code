# @param {String[]} strs
# @return {String}
# def longest_common_prefix(strs)
#   longest_prefix = []
#   first_word = strs.shift()

#   puts "first_word: " + first_word
#   puts "strs.length: #{strs.length}" 

#   strs.each_with_index do |word, i|
#     letters = strs[i].chars()
    
#     letters.each_with_index do |letter, j|
#       # the letters match
#       if(letter == first_word[j])
#         puts "letter match: #{letter}"
#         # if the current prefix is shorter than the index then add the letter
#         if(longest_prefix.length <= j)
#           longest_prefix.push(letter)
#         end 
        
#       # the letters do not match
#       # shorten the prefix to the number of matches for the current word
#       elsif(longest_prefix.length > j)
#         # remove all letters that remain 
#         longest_prefix = longest_prefix[0..j] 
#       end 
#       puts "longest_prefix: #{longest_prefix}"
#     end 
#   end 

#   return longest_prefix 
# end


def longest_common_prefix(words)
  prefix = ""
  # get the length of the shortest word
  length = words.map { |s| s.length }.min
  0.upto(length - 1) do |i|
      puts "i: #{i}"
      char = words[0][i]
      # for each letter, check every word
      words.each { |s| return prefix if s[i] != char }
      puts "prefix += char"
      prefix += char
  end
  puts "the final prefix"
  prefix
end

# words = ["flower","flow","flight"]
# print(longest_common_prefix(words))



# @param {String} s
# @return {Boolean}
def is_valid(s)
  return true if s.empty?

  parentheses = []
  
  s.each_char do |paren|
    # print parentheses
    case paren 
    when "(", "{", "["
        parentheses << paren
    when ")"
        if "(" != parentheses.pop()
          return false
        end
    when "}"
      if "{" != parentheses.pop()
        return false
      end
    when "]"
      if "[" != parentheses.pop()
        return false
      end 
    end 
  end

  return parentheses.empty?
end


# Input: s = "()[]{}"
# Output: true
s = "()[]{}"
puts "expected true: #{is_valid(s)}"

s = "({})"
puts "expected true: #{is_valid(s)}"

# this case doesn't exist
# s = "({[{}()]}]"
# puts "expected true: #{is_valid(s)}"

s = "()"
puts "expected true: #{is_valid(s)}"


s = "(}"
puts "expected false: #{is_valid(s)}"
