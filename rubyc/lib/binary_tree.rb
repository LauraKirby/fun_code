# breadth-first

class Tree
  attr_accessor :left, :right, :data, :parent

  def initialize(x=nil, parent=nil)
    @left = nil
    @right = nil
    @data = x
    @parent = parent
  end

  def insert(x)
    list = []


    if @data == nil
      @data = x
    elsif @left == nil
      @left = Tree.new(x, parent)
    elsif @right == nil
      @right = Tree.new(x, parent)
    else
      list.push(@left, @right)
      loop do
        node = list.shift
        if node.left == nil
          node.insert(x)
          break
        else
          list.push(node.left)
        end
        if node.right == nil
          node.insert(x)
          break
        else
          list.push(node.right)
        end
      end
    end
  end

  def traverse()
    list = []
    yield @data
    list.push(@left) if @left != nil
    list.push(@right) if @right != nil
    loop do
      break if list.empty?
      node = list.shift
      yield node.data
      list.push(node.left) if node.left != nil
      list.push(node.right) if node.right != nil
    end
  end

  def search(data)
    if self.data == data
      puts "found: #{@data}"

      return self
    elsif data < self.data
      puts "left.search(data): #{data}"
      return self.left ? left.search(data) : nil
    else
      puts "right.search(data): #{data}"
      return self.right ? right.search(data) : nil
    end
  end

  def search_ancestors(data, ancestor_nodes=[])
    puts "data: #{@data}"
    ancestor_nodes.push(data)
    if self.data == data
      ancestor_nodes.push(@data)
      puts "found @data: #{@data}"
      puts "self.data: #{self.data}"
      puts "data: #{data}"

      return ancestor_nodes
    elsif data < self.data
      ancestor_nodes.push(@data)
      puts "left @data: #{@data}"
      puts "self.data: #{self.data}"
      puts "data: #{data}"
      # left.search_ancestors(@data, ancestor_nodes) if left
      return left ? left.search_ancestors(@data, ancestor_nodes) : nil
    else
      ancestor_nodes.push(@data)
      puts "right @data: #{@data}"
      puts "self.data: #{self.data}"
      puts "data: #{data}"
      # right.search_ancestors(@data, ancestor_nodes) if right


      return right ? right.search_ancestors(@data, ancestor_nodes) : nil
    end
    return ancestor_nodes
  end

  def depth_first_search(start=data, target)
    if self.data == target
      return target
    elsif data == nil
      puts "not found"
      return false
    end

    if left
      puts "left #{left.data}"
      depth_first_search(left, target)

    end

  end

  def dfs_rec(item, node=nil)

    return nil if self.data.nil?
    return data if data == item

    left_node = dfs_rec(item, left)
    right_node = dfs_rec(item, right)

  end


  def print_ancestors(node, target)
    #  base cases
    if data == nil
        return false;
    elsif data == target
        return true;
    end
    # If target is present in either left or right subtree
    # of this node, then print this node
    if (print_ancestors(left, target)|| print_ancestors(right, target))
        puts "new data #{data}"
        return true;
      else
        return false;
    end
  end

end

items = [1,2,3,4,5,6,7]
tree = Tree.new
items.each {|x| tree.insert(x)}

tree.search(4)

# tree.traverse { |x| print "#{x} "}
# tree_2 = tree.search_ancestors(7)
# tree_2.traverse { |x| print "#{x} "}
# puts "\n\n"
# print tree.search_ancestors(7)
# print tree.search_ancestors(4)
tree.print_ancestors(1,4)

# tree.depth_first_search(1,4)
tree.dfs_rec(4)