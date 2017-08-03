# given two strings, write a method to decide if one is a
# permutation of the other.

# def checkPermutation(str_1, str_2)


# end


def permute(result,input)
  if(input.length == 0)
    return
  end

  if(input.length == 1)
    puts result + input[0]
    return
  end

  if(input.length == 2)
    puts result + input[0] + input[1]
    puts result + input[1] + input[0]
    return
  end

  input.split("").each.with_index(1) do |val, i|
    # start at index of 1, since we want all permutations where the first letter is the same
    first_part = result+input[i]
    # first part = h

    if (i > 0)
      second_part = input[0..(i-1)]
    else
      second_part = ""
    end

    (input[(i+1)..-1]) ? (second_part + (input[(i+1)..-1])) :  (second_part + '')

    # second_part = (s > 0 ? input[0..(s-1)] : '') + (input[(s+1)..-1] || '')
    # puts input[0..(s-1)] ? input[0..(s-1)] : 'n/a'

    permute(first_part,second_part)
  end
end

permute("", "hithere")
# hi, ih
#  should be true

# hi, hn
#   should be false