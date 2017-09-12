# Get the email with the largest key
# Remove and get the email with the largest key
# Using a heap,
  # Operation #1 can be done in O(1) time and
  # Operation #2 can be done in O(log_2{n}) time

# Basically, a heap is an array with the special condition
# that, when visualized as a tree, the max heap property holds.
# In other words, the children of each node have key values
# smaller than that of the node itself.

# order email inbox

class Heap
  attr_accessor :heap_size, :array_rep

  def initialize(array_rep)
    @array_rep = array_rep
    @heap_size = array_rep.length
  end

  # return index of the child of a given node
  # in the array representation
  def left_child(indx)
    2*indx + 1
  end

  def right_child(indx)
    2*indx + 2
  end

  def left_child_key(indx)
    @array_rep[left_child(indx)]
  end

  def right_child_key(indx)
    @array_rep[right_child(indx)]
  end

  # determine whether a given element is a leaf node or not
  def leaf_node?(indx)
    return indx >= @heap_size/2
  end

  # tell if a node already satisfies the max heap property
  # (in which case, we don’t need to keep fixing errors)
  def satisfied?(indx)
    @array_rep[indx] >= left_child_key(indx) &&
      @array_rep[indx] >= right_child_key(indx)
  end

  # O(log_2 n)
  def fix_one_error(indx)
    return if leaf_node?(indx) || satisfied?(indx)

    left_child_key = @array_rep[left_child(indx)]
    right_child_key = @array_rep[right_child(indx)]

    puts "index: #{indx}"
    puts "right_child indx: #{right_child(indx)}"
    puts "left_child indx: #{left_child(indx)}"
    puts "left_child var: #{left_child_key}"
    puts "right_child var: #{right_child_key}"
    # larger_child = if _left_child_key > _right_child_key then left_child(indx)
      # else right_child(indx) end
    left_child_key > right_child_key ? larger_child = left_child(indx) : larger_child = right_child(indx)

    @array_rep[indx], @array_rep[larger_child] = @array_rep[larger_child], @array_rep[indx]

    fix_one_error(larger_child)
  end

  # the children of each node have key values
  # smaller than that of the node itself.
  # start with the leaf nodes and then gradually move
  # up the tree, fixing errors as we go along.
  # as we move higher in the tree, there are fewer and fewer nodes.
  # time complexity: O(n)
  def create_max_heap
    (0..@heap_size/2-1).to_a.reverse.each do |indx|
       fix_one_error(indx)
    end
  end

  def get_max
    array_rep[0]
  end

  def get_and_remove_max
    array_rep[@heap_size-1], array_rep[0] = array_rep[0], array_rep[@heap_size-1]
    @heap_size -= 1
    fix_one_error(0)
  end
end

arr = [8, 4, 1, 10, 2, 7]
# arr = [10, 4, 8, 2, 1, 7]
my_heap = Heap.new(arr)
puts my_heap
puts "heap: #{my_heap.left_child(1)}"
puts my_heap.create_max_heap
puts my_heap.array_rep