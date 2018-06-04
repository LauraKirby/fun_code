# Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

# k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

# You may not alter the values in the nodes, only nodes itself may be changed.

# Only constant memory is allowed.

# For example,
# Given this linked list: 1->2->3->4->5

# For k = 2, you should return: 2->1->4->3->5

# For k = 3, you should return: 3->2->1->4->5


# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}

# simplify by first reverse list of nodes
# if k is equal to or less than the length of the node list,
  # reverse that set of nodes
  # if k can go into total nodes more than once,
    # treat k as the group size
    # and preform reverse on each group individually

  # example input: (head_node, 2)
    # switch nodes in sets of two
    # if total nodes is not divisble by 2,
      # do nothing with the remaining node



l_4 = ListNode.new(8)

l_3 = ListNode.new(6)
l_3.next = l_4

l_2 = ListNode.new(4)
l_2.next = l_3

l_1 = ListNode.new(2)
l_1.next = l_2

last_node = ListNode.new(0)


def print_node_list(head, result="")
  result << "#{head.val}"
  # puts result if (head.next == nil)
  return result if (head.next == nil)
  result << ", "
  print_node_list(head.next, result)
end

# print_node_list(l_1)





def reverse_list(current_head, previous=nil)
  # puts "current_head.val: #{current_head.val}" if current_head.next == nil
  return current_head if current_head.next == nil

  higher_val_node = current_head.next
  current_head.next = previous

  reverse_list(higher_val_node, current_head)
end

# reverse_list(l_1)












# reverse_nodes = []
# def reverse_node_list(last_node)
#   last_node.next =
#   return 0 if (head.next == nil)
#   reverse_node_list(head)
# end

# def reverse_k_group(head, k)
#   puts "#{l_1.val}"
#   return if ()
# end
