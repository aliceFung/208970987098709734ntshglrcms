# class Node

#   attr_reader :value, :parent, :left_child, :right_child
#   def initialize
#     @node = Struct.new(:value, :parent, :left_child, :right_child)
#   end

# end
require "pry"

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

  def find_node_with_value(num)
    parent = @root
    until parent.value == num
      return if parent.value.nil?
      if num > parent.value
        next_node = parent.right_child
        return nil if next_node.nil?
        #binding.pry
        if next_node.value == num
          return next_node
        else
          parent = next_node
        end
      elsif num <= parent.value
        next_node = parent.left_child
        if next_node.value == num
          return next_node
        else
          parent = next_node
        end
      end
    end #end until loop
    return parent
  end

  def sorted_array
    sorted =[]
    stack = [@root]
    until stack.empty?
      parent = stack.pop
      stack << parent.right_child
      until parent.left_child == nil
        stack << parent.right_child
        stack << parent.left_child.right_child
        parent = parent.left_child
      end
      sorted << parent
    end
    sorted
  end

end
