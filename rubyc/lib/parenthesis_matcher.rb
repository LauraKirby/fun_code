# use a stack to validate parenthesis completion
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

def paren_matcher(str)
  stack = Stack.new
  lsym = "{[(<"
  rsym = "}])>"

  str.each_char do |sym|
    if lsym.include? sym
      stack.push(sym)
    elsif rsym.include?(sym)
      # if stack is empty, assign top to something that
      # will never be in the symbol string
      stack.empty? ? top = "-1" : top = stack.peek
      top = stack.peek
      return false if top.nil?
      if lsym.index(top) != rsym.index(sym)
        return false
      else
        stack.pop
      end
      # ignore non-grouped characters...
    end
  end
  # puts "finish and return: #{stack.empty?}"

  # Ensure stack is empty
  return stack.empty?
end
