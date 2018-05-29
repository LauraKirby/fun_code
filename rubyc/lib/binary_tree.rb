class Node
  attr_accessor :left, :right, :val

  def initialize(val, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end


end

class BinaryTree
  attr_accessor :insert, :print_tree

  def initialize(root_value)
    @root = insert(root_value)
  end

  def insert(val)
    node = create_node(val)
    return if !node

    if !@root
      @root = node
      puts "root val: #{node.val}"
    else
      insert_node_helper(@root, node)
    end
  end

  def print_tree
    if @root == nil
      puts "root is nil"
      return
    end

    root = @root

    print_pre_order(root)
  end

private
  def create_node(val)
    # do not create a new node if 'nil' is passed in
    if val == nil
      puts "node was not created"
      return
    end

    puts "new node created"
    return Node.new(val)
  end

  def insert_node_helper(root, new_node)
    if !root.left
      root.left = new_node
      puts "added to left tree: #{new_node.val}"
      return
    elsif !root.right
      root.right = new_node
      puts "added to right tree: #{root.right.val}"
      return
    end

    #move left
    if root.left
      insert_node_helper(root.left, new_node)

    #move right
    elsif root.right
      insert_node_helper(root.right, new_node)

    end
  end


  def print_pre_order(node, side="root")
    # print root, then left, then right
    return if (node == nil)
    puts "print tree: #{node.val}, side: #{side}"
    print_pre_order(node.left, "left")
    print_pre_order(node.right, "right")
  end
end


def main
  # create binary tree
  arr = [10,2,1,4,5,7,8,17,18]
  binary_tree = BinaryTree.new(nil)


  for i in 0..arr.length - 1 do
    binary_tree.insert(arr[i])
  end

  binary_tree.print_tree
end

main

# edge cases:
# duplicates values passed in

# test cases:

# print error message if:
# nil is passed to insert
# nil was used in BinaryTree constructor
# tree exceeds limit


