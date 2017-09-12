# binary_tree_traversal.rb

class BinaryTree

  class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(nname, children)
      @nname = nname
      @children = children
    end
  end

  # "visit" (often print) the left branch, then the
  # current node, and then the right branch.
  # when preformed on a Binary Search Tree,
  # nodes are visited in ascending order
  def in_order_traversal(node)
    if node != nil
      in_order_traversal(node.left)
      visit(node)
      in_order_traversal(node.right)
    end
  end

  # visit the current node before its child nodes
  def pre_order_traveral(node)
    if node != nil
      visit(node)
      in_order_traversal(node.left)
      in_order_traversal(node.right)
    end
  end

  # visits the current node after its child nodes
  def post_order_traveral(node)
    if node != nil
      in_order_traversal(node.left)
      in_order_traversal(node.right)
      visit(node)
    end
  end
end
 bt = BinaryTree.new(5)