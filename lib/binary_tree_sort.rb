class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end

end

class BTreeSort
  attr_accessor :array, :sort_ary, :tree, :current_parent

  def initialize(array)
    @array = array
    @tree = BinaryTree.new(@array.shift, nil, nil)
    @sort_ary = []
    @top_node = @tree
    @current_parent = nil
  end

  def build_tree(node)
    return @tree if @array.empty?
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

  def tree_sort(node)
    return @sort_ary if !defined?(node.left)

    if @top_node.left.nil?
      @sort_ary.push(@top_node.payload)
      @top_node = @top_node.right
      tree_sort(@top_node)
    elsif !node.left.nil?
      @current_parent = node
      tree_sort(node.left)
    elsif node.left.nil?
      @sort_ary.push(node.payload)
      if !node.right.nil?
        tree_sort(node.right)
      elsif node.right.nil?
        @current_parent.left = nil
        tree_sort(@top_node)
      end
    end
  end
end


tree = BTreeSort.new([7, 4, 9, 1, 6, 14, 10])
tree.build_tree(tree.tree)
puts tree.tree.inspect
tree.tree_sort(tree.tree)
puts tree.sort_ary.inspect
puts tree.current_parent.inspect
puts tree.tree.inspect
