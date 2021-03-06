# class Node

#   attr_reader :value, :parent, :left_child, :right_child
#   def initialize
#     @node = Struct.new(:value, :parent, :left_child, :right_child)
#   end

# end
require "pry"

Node = Struct.new(:value, :parent, :left_child, :right_child)

class BinarySearchTree

  attr_reader :root, :nodes

  def initialize(input)
    raise ArgumentError if input.nil?
    raise ArgumentError unless input.is_a? Array
    raise ArgumentError unless input.all?{|i| i.is_a? Integer}
    @input = input
    @nodes = 1
    @root = Node.new(@input[0], nil, nil, nil)
    grow_tree(root, @input[1..-1])
    #@root = Node.new(input[0], nil, input[3])
  end

  def root
    # root_value = @input[0]
    # # children = @input[1..-1]
    # root = Node.new(root_value, nil, nil, nil)
    # grow_tree(root, @input[1..-1])
    @root
  end

  def grow_tree(root, array)
    array.each do |num|
      add_children(root, num)
    end
  end

  def add_children(parent, num)
    if num > parent.value
      if parent.right_child.nil?
        child = Node.new(num, parent)
        @nodes +=1
        parent.right_child = child
      else
        parent = parent.right_child
        add_children(parent, num)
      end
    elsif num <= parent.value
      if parent.left_child.nil?
        child = Node.new(num, parent)
        @nodes +=1
        parent.left_child = child
      else
        parent = parent.left_child
        add_children(parent, num)
      end
    end
  end

  def find_node_with_value(num)
    parent = @root
    next_node = nil
    until parent.value == num
      if num > parent.value
        next_node = parent.right_child
      elsif num < parent.value
        next_node = parent.left_child
      end
      parent = next_node
      return nil if parent.nil?
    end #end until loop
    return parent
  end

  def sorted_array
    sorted =[]
    stack = [@root]
    until stack.empty?
      current = stack.pop
      left = current.left_child
      right = current.right_child
      # stack << right unless right.nil?
      # if left.nil?
      #   sorted << current.value
      #   while right.nil? && current != current.parent.right_child
      #     break if current.parent.nil?
      #     sorted << current.parent.value
      #     current = current.parent
      #     right = current.right_child
      #   end
      # else
      #   stack << left
      # end
      #
      # the cheap method below, using sort method
      sorted << current.value
      stack << left unless left.nil?
      stack << right unless right.nil?
    end
    sorted.sort
  end


  def min
    parent = @root
    until parent.left_child.nil?
      parent = parent.left_child
    end
    parent.value
  end


  def max
    parent = @root
    until parent.right_child.nil?
      parent = parent.right_child
    end
    parent.value
  end

  def count
    @nodes
  end

end
