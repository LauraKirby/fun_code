# http://algorithms.tutorialhorizon.com/find-the-distance-between-two-nodes-of-a-binary-tree/
# http://www.techiedelight.com/distance-between-given-pairs-of-nodes-binary-tree/
# http://www.geeksforgeeks.org/find-distance-two-given-nodes/
class BST
    attr_accessor :root

    class Node
        attr_accessor :nkey, :left, :right
        def initialize(nkey)
            @nkey = nkey
            @left = nil
            @right = nil
        end

        def insert_node(new_nkey)
            if new_nkey <= @nkey
                @left.nil? ? @left = BST::Node.new(new_nkey) : @left.insert_node(new_nkey)
            elsif new_nkey > @nkey
                @right.nil? ? @right = BST::Node.new(new_nkey) : @right.insert_node(new_nkey)
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

    def insert(nkey)
        if @root.nil?
            @root = BST::Node.new(nkey)
        else
            @root.insert_node(nkey)
        end
    end

    def travese(node, count = 0)
        index1 = 0
        index2 = 0
        if node != nil
            index1 = count if node.nkey == @node1
            index2 = count if node.nkey == @node2
            # print " node.nkey: #{node.nkey}, "

            travese(node.left, count+=1)
            travese(node.right, count+=1)
            puts "node.nkey: #{node.nkey}"
            # puts "count: #{count}"
        end
        puts "index1 + index2: #{index1} + #{index2}"
    end


    def check_height(node)
      return 0 if node.nil?

      left_height = check_height(node.left)
      return -1 if left_height == -1

      right_height = check_height(node.right)
      return -1 if right_height == -1

      diff = left_height - right_height
      if diff.abs > 1
        -1
      else
        [left_height, right_height].max + 1
      end
    end

    def search(key, node=@root,height=0)
      return nil if node.nil?
      puts "-nil-"
      if key < node.nkey
        puts "node.nkey: #{node.nkey}"
        search(key, node.left, height += 1)
      elsif key > node.nkey
        search(key, node.right,  height += 1)
      else
        puts "node.nkey return: #{node.nkey}"
        puts "height: #{height}"
        return node
      end
      # height += 1
    end



    # def distance_traversal(node=@root)
    #     count = 0
    #     index1 = 0
    #     index2 = 0
    #     if node != nil
    #         puts "#{node.instance_methods}"
    #         index1 = count if node.nkey == @node1
    #         index2 = count if node.nkey == @node2
    #         count += 1
    #         distance_traversal(node.left)
    #         distance_traversal(node.right)
    #     end
    #     count += 1
    #     # puts "node.nkey: #{node.nkey}"
    #     puts "index1: #{index1}"
    #     puts "index2: #{index2}"
    #     return index1 + index2
    # end
end

# def bstDistance(values, n, node1, node2)
#     # WRITE YOUR CODE HERE
#     return -1 if !values.include?(node1) || !values.include?(node2)
#     bst = BST.new(node1, node2)
#     values.each_with_index do |v, i|
#       bst.insert(v)
#     end
#    # bst.distance_traversal()
# end



values = [5,6,3,1,2,4].sort

n = 6
node1 = 2
node2 = 6

bst = BST.new(node1, node2)

values.each_with_index do |v, i|
  bst.insert(v)
end

# puts bst.root.nkey
# puts node.nkey
# rroot = bst.root
# puts "-------------------------"
# puts bst.inspect
# puts "-------------------------"
# puts bst
# puts bst.root
# puts "bst.root.right.nkey: #{bst.root.nkey}"
# puts bst.root.left.nkey

# puts "find_lowest_common_ancestor: #{bst.find_lowest_common_ancestor(node1, node2)}"
# bst.travese()
puts "bst.travese(bst.root): #{bst.travese(bst.root)}"
# puts "bst.check_height(bst.root): #{bst.check_height(bst.root.left)}"

# bst.root.each do |n|
#     puts n.nkey
# end
# puts "bst.search(node1, bst.root) #{bst.search(node1, bst.root)}"
# puts "bst.search(node2, bst.root) #{bst.search(node2, bst.root)}"
# result = bstDistance(values, n, node1, node2)
# puts "result: #{result}"
