require_relative 'test_helper'
require './lib/fence_cipher'

class FenceCipherTest < Minitest::Test
  def test_encode_with_empty_string
    assert_equal '', RailFenceCipher.encode('', 4)
  end
end