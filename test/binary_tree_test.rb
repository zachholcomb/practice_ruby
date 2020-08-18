require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_tree'

class BinaryTreeTest < Minitest::Test
  def test_data_is_retained
    assert_equal 4, BinaryTree.new(4).data
  end

  def test_inserting_less_than_first
    tree = BinaryTree.new(4)
    tree.insert(2)
    assert_equal 4, tree.data
    assert_equal 2, tree.left.data
  end

  def test_inserting_same_number
    tree = BinaryTree.new(4)
    tree.insert(4)
    assert_equal 4, tree.data
  end

  def test_inserting_right_number
    tree = BinaryTree.new(4)
    tree.insert(5)
    assert_equal 4, tree.data
    assert_equal 5, tree.right.data
  end

  def test_complex_tree
    tree = BinaryTree.new(4)
    tree.insert(2)
    tree.insert(6)
    tree.insert(1)
    tree.insert(3)
    tree.insert(7)
    tree.insert(5)

    assert_equal 4, tree.data
    assert_equal 2, tree.left.data
    assert_equal 1, tree.left.left.data
    assert_equal 3, tree.left.right.data
    assert_equal 6, tree.right.data
    assert_equal 5, tree.right.left.data
    assert_equal 7, tree.right.right.data
  end

  def record_all_data(bst)
    all_data = []
    bst.each { |data| all_data << data }
    all_data
  end

  def test_iterating_one_element
    tree = BinaryTree.new(4)
    assert_equal [4], record_all_data(tree)
  end

  def test_iterating_smaller_element
    tree = BinaryTree.new(4)
    tree.insert(2)
    assert_equal [2, 4], record_all_data(tree)
  end
  
  def test_iterating_bigger_element
    tree = BinaryTree.new(4)
    tree.insert(5)
    assert_equal [4, 5], record_all_data(tree)
  end

  def test_complex_iteration
    tree = BinaryTree.new(4)
    tree.insert 2
    tree.insert 1
    tree.insert 3
    tree.insert 6
    tree.insert 7
    tree.insert 5
    assert_equal [1, 2, 3, 4, 5, 6, 7], record_all_data(tree)
  end

  def test_each_returns_enumerator_if_no_block
    tree = BinaryTree.new 4
    [2, 1, 3, 6, 7, 5].each { |x| tree.insert x }
    each_enumerator = tree.each

    assert_kind_of Enumerator, each_enumerator

    (1..7).each { |x| assert_equal(x, each_enumerator.next) }

    assert_raises(StopIteration) { each_enumerator.next }
  end
end