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

    #@root = Node.new(input[0], nil, input[3])
  end

  def root
    root_value = @input[0]
    # children = @input[1..-1]
    root = Node.new(root_value, nil, nil, nil)
    grow_tree(root, @input[1..-1])
    root
  end

  def grow_tree(root, array)
    array.each do |num|
      add_children(root, num)
    end
  end

  def add_children(parent, num)
    if num > parent.value
      unless parent.right_child.nil?
        parent = parent.right_child
        add_children(parent, num)
      end
      child = Node.new(num, parent)
      parent.right_child = child
    elsif num <= parent.value
      unless parent.left_child.nil?
        parent = parent.left_child
        add_children(parent, num)
      end
      child = Node.new(num, parent)
      parent.left_child = child
    end
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
