# LIFO - last in first out
# Algorithms that use the 'Stack' data structure
#   often have elegant recursive solutions
#   Method calls result in data being pushed onto the
#   system stack. This is popped upon return
#
#   Thus, a recursive algorithm simply trades an
#   explicit user-defined stack for the implicit
#   system-level stack.

# Define a Stack class so that elements can only
# be accessed legally.
# legally, meaning to maintain the Stack structure and
#   safety implications, there are a limited set of
#   operations. push, pop, empty?, examine top element

class Stack
  def initialize
    @store = []
  end

  def push(x)
    @store.push(x)
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end
end

# stack = Stack.new
# stack.push("hello")
# puts stack.inspect

