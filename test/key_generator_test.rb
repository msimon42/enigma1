require_relative 'test_helper'
require_relative '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_generator
    rand_num = KeyGenerator.generate
    assert rand_num.length == 5
    assert rand_num[0] == '0'
  end
end
