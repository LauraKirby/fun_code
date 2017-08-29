class BST
    class Node
        attr_accessor :key, :left, :right
        def initialize(key)
            @key = key
            @left = nil
            @right = nil
        end

        def insert(new_key)
            if new_key <= @key
                @left.nil? ? @left = Node.new(new_key) : @left.insert(new_key)
            elsif new_key > @key
                @right.nil? ? @right = Node.new(new_key) : @right.insert(new_key)
            end
        end
    end

    def initialize(node1, node2)
        @root = nil
        @node1 = node1
        @node2 = node2
    end

    def insert(key)
        puts "hello"
        if @root.nil?
            @root = Node.new(key)
            puts @root.key
        else
            @root.insert(key)
            puts @root.key
        end
    end

    def distance_traversal(node=@root)
        count = 0
        index1 = 0
        index2 = 0
        puts @root
        if node != nil
            index1 = count if node.key == @node1
            index2 = count if node.key == @node2
            count += 1
            distance_traversal(node.left)
            distance_traversal(node.right)
        end
        return index1 + index2
    end
end

def bstDistance(values, n, node1, node2)
    # WRITE YOUR CODE HERE
    return -1 if !values.include?(node1) || !values.include?(node2)
    bst = BST.new(node1, node2)
    values.each do |v|
      bst.insert(v)
    end
   bst.distance_traversal()
end


values = [5,6,3,1,2,4]
n = 6
node1 = 2
node2 = 4
bst = bstDistance(values, n, node1, node2)

