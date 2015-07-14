# class Node

#   attr_reader :value, :parent, :left_child, :right_child
#   def initialize
#     @node = Struct.new(:value, :parent, :left_child, :right_child)
#   end

# end

Node = Struct.new(:value, :parent, :left_child, :right_child)

class BinarySearchTree

  attr_reader :root

  def initialize(input)
    raise ArgumentError if input.nil?
    raise ArgumentError unless input.is_a? Array
    raise ArgumentError unless input.all?{|i| i.is_a? Integer}
    @input = input
    @root = self.root
    add_children(@root, @input[1..-1])
    #@root = Node.new(input[0], nil, input[3])
  end

  def root
    root_value = @input[0]
    # children = @input[1..-1]
    root = Node.new(root_value, nil, nil, nil)
    # root.left_child, root.right_child = make_child(root_value, children)
    # root
  end

  def add_children(parent, array)

  end
  # def make_child(parent, children_array)
  #   return if children_array.nil
  #   next_value = children_array[0]
  #   if next_value > parent
  #     right = Node.new(next_value, parent)
  #     parent.right_child = right
  #     right.left_child = make_child(right, children_array[n/2..-1])
  #     right.right_child = make_child(right, children_array[1..n/2-1])
  #   elsif next_value <= parent
  #     left = Node.new(next_value, parent)
  #     parent.left_child = left
  #     left.left_child = make_child(left, children_array[n/2..-1])
  #     left.right_child = make_child(left, children_array[1..n/2-1])
  #   end
  # end
end
