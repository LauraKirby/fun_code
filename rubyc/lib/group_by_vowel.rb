require 'rspec/autorun'
# Given a list of words, group them by the vowels (AEIOUY) they contain. A word with multiple different vowels may
# appear in multiple groups, but should not appear in a single group more than once.

# Examples:
# ["hot", "cold", "warm", "every"] => { "o": ["hot", "cold"], "a": ["warm"], "e": ["every"], "y": ["every"] }
# [ "cat", "team", "bet"] => { "a": ["cat", "team"], "e": ["team", "bet"] }

# test cases
# ["hot"] key "o" should have the value "hot"

# edge cases
# assume: case insensitive, no empty strings, all of type String, all letters a-z

# create hash from vowels
# iterate over array and add words to keys

def group_by_vowel(input)
  vowel_hash = {}

  input.each do |word|
    word.split("").each do |character|
      if character == "a" || character == "e" || character == "i" || character == "o" || character == "u" || character == "y"
        if !vowel_hash[character]
          vowel_hash[character] = [word]
        elsif !vowel_hash[character].include?(word)
          vowel_hash[character].push(word)
        end
      end
    end
  end

  vowel_hash
end
