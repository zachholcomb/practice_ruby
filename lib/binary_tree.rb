class BinaryTree
  attr_reader :data
  attr_accessor :left, :right

  def initialize(value)
    @data = value
    @left = nil
    @right = nil
  end

  def insert(value)
    if data > value || data == value
      return @left = BinaryTree.new(value) if left.nil?

      traverse(value, self)
    elsif data < value
      return @right = BinaryTree.new(value) if right.nil?

      traverse(value, self)
    end
  end

  def traverse(value, node)
    if node.data > value
      return node.left = BinaryTree.new(value) if node.left.nil?

      node = node.left
      traverse(value, node)
    elsif node.data < value
      return node.right = BinaryTree.new(value) if node.right.nil?

      node = node.right
      traverse(value, node)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    left.each(&block) unless left.nil?
    block.call(self.data)
    right.each(&block) unless right.nil?
  end
end

