class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def has_children?
    @children.blank?
  end

  def self.depth_first_search(node)
    puts node.payload
    return node.payload if node.payload == 11

    node.children.each do |child|
      found = depth_first_search(child) and return found
    end   
    nil
  end


  def self.print_tree(node)
    puts node.payload
    node.children.each do | child |
      depth_first_search(child)
    end
  end
end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

# print tree
Tree.depth_first_search(trunk)
Tree.print_tree(trunk)
