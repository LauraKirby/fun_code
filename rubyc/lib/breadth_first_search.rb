# Returns the first node for which fn(node) is truthy
def breadth_first_search(root_node)
  #
  queue = root_node.pop

  while queue.length > 0
    node = queue.pop

    if node == "three"
      return node
    else
      queue = queue.pop
    end
  end

end


q = Queue.new
q.push("one")
q.push("two")
q.push("three")
result = breadth_first_search(queue)

breadth_first_search(q)


