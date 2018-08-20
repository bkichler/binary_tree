class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end

end

class BTreeSort
  attr_accessor :array

  def initialize(array)
    @array = array
    @tree = BinaryTree.new(@array.shift, nil, nil)
  end

  def self.build_tree
    start = @tree.payload
    
  end
end

tree = BTreeSort.new([7, 4, 9, 1, 6, 14, 10]).build_tree
puts tree.inspect
