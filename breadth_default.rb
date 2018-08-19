class Queue
    attr_accessor :queue
    def initialize
        @queue = []
    end

    def enqueue(item)
        @queue.push(item)
    end

    def dequeue
        @queue.shift
    end

    def first
        @queue.first
    end

    def empty?
        @queue.empty?
    end
end

class Tree
attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

    def self.depth_first_search(node)
        puts node.payload
        return node.payload if node.payload == 11

        node.children.each do |child|
            found = depth_first_search(child) and return found
        end   
        nil
    end

    def self.breadth_first_search(node)
        current_children = node.children
        queue = Queue.new
        visited = Array.new.push(node.payload)

        while node
            current_children.each do | child |
                queue.enqueue(child)
                visited << child.payload
            end

            working_node = queue.first
            queue.dequeue

            if visited.last == 11
                return puts visited
            else
                current_children = working_node.children
            end
        end
    end

    def self.print_tree(node)
        puts node.payload
        node.children.each do | child |
        print_tree(child)
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
# Tree.depth_first_search(trunk)
Tree.breadth_first_search(trunk)



