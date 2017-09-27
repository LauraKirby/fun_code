class Tree
  attr_accessor :left, :right, :data

  def initialize(data=nil)
    @left = nil
    @right = nil
    @data = data
  end

  def insert(data)
    list = []
    if @data == nil
      @data = data
    elsif @left == nil
      @left = Tree.new(data)
    elsif @right == nil
      @right = Tree.new(data)
    else
      # aka check these items for empty nodes
      list.push(@left, @right)
      loop do
        # remove first item from list
        # left item
        node = list.shift
        if node.left == nil
          # use logic from above to set the correct value at this subtree
          node.insert(data)
          break
        else
          list.push(node.left)
        end
        if node.right == nil
          node.insert(data)
          break
        else
          list.push(data)
        end
      end
    end
  end

end