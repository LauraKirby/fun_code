# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end
# determine which list has a higher start value
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}


def merge_two_lists(l1, l2)
    result = []
    i = 0
    while l1[i] || l2[i]
      if l1[i] < l2[i]
        result.push(l1[i])
      elsif l2[i] > l1[i]
        result.push(l2[i])
      end
      i += 1
    end

    # print result
    result
end

l1 = [3,5,9]
l2 = [6,8,10]

merge_two_lists(l1, l2)
