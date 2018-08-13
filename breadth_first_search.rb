class Node
  attr_accessor :value, :left_child, :right_child, :current_left_child, :current_right_child
  def initialize(value, left_child=nil, right_child=nil)
    @value        = value
    @left_child   = left_child
    @right_child  = right_child
  end

  def current_left_child
    @left_child
  end

  def current_right_child 
    @right_child
  end
end

class Tree
  attr_accessor :trunk, :value
  def initialize(value)
    @trunk = Node.new(value)
  end

  def self.push_left(tree, value)
    current_left = tree.trunk.current_left_child
    if current_left.nil?
      tree.trunk.left_child = Node.new(value)
    else
      current_left.left_child = Node.new(value)
    end
  end

  def self.push_right(tree, value)
    current_right = tree.trunk.current_right_child
    if current_right.nil?
      tree.trunk.right_child = Node.new(value)
    else
      current_right.right_child = Node.new(value)
    end
  end
end

class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end
  
  
queue = MyQueue.new


  
