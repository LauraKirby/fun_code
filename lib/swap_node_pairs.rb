# Leetcode setup
# Given a linked list, swap every two adjacent nodes and return its head.

# For example,
# Given 1->2->3->4, you should return the list as 2->1->4->3.

# Your algorithm should use only constant space.
# You may not modify the values in the list, only nodes itself can be changed.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
      @val = val
      @next = nil
    end

    def self.list(node, msg=nil)
      msg ||= ""
      return msg[0..-4] if node.nil?
      list(node.next, msg << "#{node.val} -- ")
    end
end

# @param {ListNode} head
# @return {ListNode}
head_node_0 = ListNode.new(307)

node_1 = ListNode.new(12)
head_node_0.next = node_1

node_2 = ListNode.new(24)
node_1.next = node_2


node_3 = ListNode.new(3)
node_2.next = node_3

node_4 = ListNode.new(55)
node_3.next = node_4


binding.pry
def swap_pairs(head)

end

