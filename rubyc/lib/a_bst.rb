# http://algorithms.tutorialhorizon.com/find-the-distance-between-two-nodes-of-a-binary-tree/
# http://www.techiedelight.com/distance-between-given-pairs-of-nodes-binary-tree/
# http://www.geeksforgeeks.org/find-distance-two-given-nodes/
class BST
    attr_accessor :root

    class Node
      attr_accessor :node_data, :left, :right
      def initialize(node_data=nil)
          @node_data = node_data
          @left = nil
          @right = nil
      end

      def insert_node(new_node_data)
        if new_node_data <= @node_data
          @left.nil? ? @left = BST::Node.new(new_node_data) : @left.insert_node(new_node_data)
        elsif new_node_data > @node_data
          @right.nil? ? @right = BST::Node.new(new_node_data) : @right.insert_node(new_node_data)
        end
      end

      def each
        @left.each {|node| yield node } unless @left.nil?
        yield self
        @right.each {|node| yield node } unless @right.nil?
      end
    end

    def initialize(node1, node2)
      @root = nil
      @node1 = node1
      @node2 = node2
    end

    def insert(node_data)
      if @root.nil?
        @root = BST::Node.new(node_data)
      else
        @root.insert_node(node_data)
      end
    end




end




values = [5,6,3,1,2,4].sort

n = 6
node1 = 2
node2 = 6

bst = BST.new(node1, node2)

values.each_with_index do |v, i|
  bst.insert(v)
end

# puts bst.root.node_data
# puts node.node_data
# rroot = bst.root
# puts "-------------------------"
# puts bst.inspect
# puts "-------------------------"
# puts bst
# puts bst.root
# puts "bst.root.right.node_data: #{bst.root.node_data}"
# puts bst.root.left.node_data

# puts "find_lowest_common_ancestor: #{bst.find_lowest_common_ancestor(node1, node2)}"
# bst.travese()
puts "bst.travese(bst.root): #{bst.travese(bst.root)}"
# puts "bst.check_height(bst.root): #{bst.check_height(bst.root.left)}"

# bst.root.each do |n|
#     puts n.node_data
# end
# puts "bst.search(node1, bst.root) #{bst.search(node1, bst.root)}"
# puts "bst.search(node2, bst.root) #{bst.search(node2, bst.root)}"
# result = bstDistance(values, n, node1, node2)
# puts "result: #{result}"
