require 'week_2_assessment'

describe Node do

  let(:node){ Node.new }

  it "is a Struct" do
    expect(node).to be_a Struct
  end

  it "has a value method" do
    expect(node).to respond_to :value
  end

  it "has a parent method" do
    expect(node).to respond_to :parent
  end

  it "has a left_child method" do
    expect(node).to respond_to :left_child
  end

  it "has a right_child method" do
    expect(node).to respond_to :right_child
  end

end


describe BinarySearchTree do

  let(:tiny_array){ [2,3,1] }
  let(:tiny_tree){ BinarySearchTree.new tiny_array }

  let(:large_array){ [55, 75, 77, 33, 19, 35, 46, 81, 86, 67, 8, 32, 39, 83, 70, 21, 76, 57, 28, 6] }
  let(:large_tree){ BinarySearchTree.new large_array }

  describe "#new" do

    it "requires an argument" do
      expect{
        BinarySearchTree.new
      }.to raise_error(ArgumentError)
    end

    it "requires that the argument be an array" do
      expect{
        BinarySearchTree.new "I'm a node!"
      }.to raise_error(ArgumentError)
    end

    it "requires the array to contain only integers" do
      expect{
        BinarySearchTree.new ["a","b","c"]
      }.to raise_error(ArgumentError)
    end
  end

  describe "#root" do

    context "with tiny array" do

      let(:root){ tiny_tree.root }

      it "returns a Node object" do
        expect(root).to be_a Node
      end

      it "has a value equal to the first integer of the input array" do
        expect(root.value).to eq 2
      end

      it "has no parent" do
        expect(root.parent).to be nil
      end

      it "has a right child node with a value equal to 3" do
        expect(root.right_child.value).to eq 3
      end

      it "has a left child node with a value equal to 1" do
        expect(root.left_child.value).to eq 1
      end

    end

    context "with large array" do

      let(:root){ large_tree.root }

      it "returns a Node object" do
        expect(root).to be_a Node
      end

      it "has a value equal to the first integer of the input array" do
        expect(root.value).to eq 55
      end

      it "has no parent" do
        expect(root.parent).to be nil
      end

      it "has a right child node with a value of 75, the first integer in the array greater than 55" do
        expect(root.right_child.value).to eq 75
      end

      it "has a left child node with a value of 33, the first integer in the array less than 55" do
        expect(root.left_child.value).to eq 33
      end

    end

  end

  describe "#find_node_with_value" do

    context "searching one level down with a tiny tree" do
      context "looking for the right child" do
        let(:right_child){ tiny_tree.find_node_with_value(3) }

        it "returns a Node object" do
          expect(right_child).to be_a Node
        end

        it "has a value equal to 3" do
          expect(right_child.value).to eq 3
        end
      end

      context "looking for the left child" do
        let(:left_child){ tiny_tree.find_node_with_value(1) }

        it "returns a Node object" do
          expect(left_child).to be_a Node
        end

        it "has a value equal to 1" do
          expect(left_child.value).to eq 1
        end
      end
    end

    context "searching several levels down in a large tree" do
      context "when the value is present" do

        let(:node){ large_tree.find_node_with_value(46) }

        it "returns a Node object" do
          expect(node).to be_a Node
        end

        it "has a value of 46" do
          expect(node.value).to be 46
        end
      end

      context "when the value is not present" do

        let(:node){ large_tree.find_node_with_value(20) }

        it "returns nil" do
          expect(node).to be nil
        end

      end
    end
  end

  describe "#sorted_array" do
    context "with tiny array" do
      it "returns an array with the values sorted" do
        expect(tiny_tree.sorted_array).to eq [1,2,3]
      end
    end
    context "with large array" do
      it "returns an array with the values sorted" do
        sorted_large_array = [6, 8, 19, 21, 28, 32, 33, 35, 39, 46, 55, 57, 67, 70, 75, 76, 77, 81, 83, 86]
        expect(large_tree.sorted_array).to eq sorted_large_array
      end
    end
  end

  describe "#min" do
    context "with tiny array" do
      it "returns the smallest value" do
        expect(tiny_tree.min).to eq 1
      end
    end

    context "with large array" do
      it "returns the smallest value" do
        expect(large_tree.min).to eq 6
      end
    end
  end

  describe "#max" do
    context "with tiny array" do
      it "returns the largest value" do
        expect(tiny_tree.max).to eq 3
      end
    end

    context "with large array" do
      it "returns the largest value" do
        expect(large_tree.max).to eq 86
      end
    end
  end

  describe "#count" do
    context "with tiny array" do
      it "returns the number of nodes in the tree" do
        expect(tiny_tree.count).to eq 3
      end
    end

    context "with large array" do
      it "returns the number of nodes in the tree" do
        expect(large_tree.count).to eq 20
      end
    end
  end
end
