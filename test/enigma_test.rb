require_relative 'test_helper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma_1 = Enigma.new
  end

  def test_existence
    assert_instance_of Enigma, @enigma_1
  end

  def test_chars
    chars = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g',
      'h', 'i', 'j', 'k', 'l', 'm', 'n',
      'o', 'p', 'q', 'r', 's', 't', 'u',
      'v', 'w', 'x', 'y', 'z', ' '
    ]
    assert_equal @enigma_1.char_set, chars
  end

  def test_encrypt
    output = {
      :ciphertext => 'oopcvj fyvh',
      :key => '01012',
      :date => '220894'
    }

    assert_equal output, @enigma_1.encrypt('hello world')
  end
end
