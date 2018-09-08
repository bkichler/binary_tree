class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end

end

class BTreeSort
  attr_accessor :array, :tree, :current_node

  def initialize(array)
    @array = array
    @tree = BinaryTree.new(@array.shift, nil, nil)
    @top_node = @tree
    @current_node = nil
  end

  def build_tree(node)
    if @array.first < node.payload
      if node.left.nil?
        node.left = BinaryTree.new(@array.shift, nil, nil)
        build_tree(@top_node)
      else
        @current_node = node.left
        build_tree(@current_node)
      end
    elsif @array.first > node.payload
      if node.right.nil?
        node.right = BinaryTree.new(@array.shift, nil, nil)
        build_tree(@top_node)
      else
        @current_node = node.right
        build_tree(@current_node)
      end
    end
  end
end


tree = BTreeSort.new([7, 4, 9, 1, 6, 14, 10])
tree.build_tree(tree.tree)
