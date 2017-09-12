# class SinglyLinkedList
#   attr_reader :head

#   class Node
#     attr_accessor :data, :next, :print

#     def initialize(data)
#       @data = data
#     end
#   end

#   def initialize
#     @head = nil
#   end

#   def is_empty?
#     @head.nil?
#   end

#   # Time Complexity: O(n)
#   def remove!(node_to_remove)
#     node = @head
#     prev = nil

#     until node.next.nil?
#       if node == node_to_remove
#         prev.next = node.next
#         return
#       else
#         prev = node
#       end
#       node = node.next
#     end
#   end

#   # Time Complexity: O(n)
#   # Modifies the linked list to be unique with the help of a buffer.
#   def unique!
#     node = @head
#     prev = nil
#     element_list = []

#     until node.nil?
#       if element_list.include? node.data
#         prev.next = node.next
#       else
#         element_list << node.data
#         prev = node
#       end
#       node = node.next
#     end
#   end


#   # Time Complexity: O(1)
#   def insert(data)
#     new_node = Node.new(data)
#     new_node.next = @head
#     @head = new_node
#     new_node
#   end

#   # Time Complexity: O(n)
#   def reverse_using_iteration
#     node = @head
#     prev = nil

#     until node.nil?
#       next_node = node.next
#       node.next = prev
#       prev = node
#       node = next_node
#     end

#     @head = prev
#   end

#   # Time Complexity: O(n)
#   def reverse_using_recursion(node=@head)
#     if node.next.nil?
#       @head = node
#       return
#     end

#     reverse_using_recursion(node.next)

#     node.next.next = node
#     node.next = nil
#   end

#   # Time Complexity: O(n)
#   def print(&block)
#     node = @head

#     until node.nil?
#       node = node.next
#       yield node
#     end
#   end

# end

# list = SinglyLinkedList.new()
# node = SinglyLinkedList::Node.new("hi")
# list.insert(node)
# puts list.head.data


class Node
  attr_accessor :val, :next

  def initialize(val, next_node)
      @val = val
      @next = next_node
  end
end

class LinkedList
  attr_reader :return_list, :reverse_list
  def initialize(val)
    @head = Node.new(val, nil)
  end

  def add(val)
    current_node = @head
    while current_node.next != nil
      current_node = current_node.next
    end
    current_node.next = Node.new(val, nil)
  end

  def delete(val)
    current_node.next = @head
    if current_node.val = val
      @head = current_node.next
    else
      while (current_node.next != nil) && (current_node.next.val != val)
        current_node = current_node.next
      end
      unless current_node.next == nil
        current_node.next = current_node.next.next
      end
    end
  end

  def return_list
    elements = []
    current_node = @head
    while current_node.next != nil
      elements << current_node
      current_node = current_node.next
    end
    elements << current_node

    # elements.each do |e|
    #   puts e.val
    # end
  end

  def reverse_list
    current_node = @head
    previous_node = nil
    next_node = nil

    while current_node
      next_node = current_node.next
      current_node.next = previous_node
      previous_node = current_node
      current_node = next_node
    end
    @head = previous_node
  end
end

list = LinkedList.new("water")
list.add("grounds")
list.add("cup")

list.reverse_list
list.return_list