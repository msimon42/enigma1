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
    skip
    output = {
      :ciphertext => 'oopcvj fyvh',
      :key => '01012',
      :date => '220894'
    }

    assert_equal output, @enigma_1.encrypt('hello world')
  end

  def test_decrypt
    skip
    output = {
      :ciphertext => 'hello world',
      :key => '01012',
      :date => '220894'
    }

    assert_equal output, @enigma_1.decrypt('oopcvj fyvh')
  end

  def test_get_raw_keys
    assert_equal [1, 10, 1, 12], @enigma_1.get_raw_keys('01012')
  end

  def test_date_shift
    assert_equal [9, 2, 3, 6], @enigma_1.get_date_shift('220894')
  end

end
