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
      :encryption => 'rqpcyl faxh',
      :key => '01012',
      :date => '220894'
    }

    assert_equal output, @enigma_1.encrypt('hello world', '01012', '220894')
  end

  def test_decrypt
    output = {
      :decryption => 'hello world',
      :key => '01012',
      :date => '220894'
    }

    assert_equal output, @enigma_1.decrypt('rqpcyl faxh', '01012', '220894')
  end

  def test_get_raw_keys
    assert_equal [1, 10, 1, 12], @enigma_1.get_raw_keys('01012')
  end

  def test_date_shift
    assert_equal [9, 2, 3, 6], @enigma_1.get_date_shift('220894')
  end

  def test_get_keys
    assert_equal [10, 12, 4, 18], @enigma_1.get_keys('01012', '220894')
  end

  def test_rotate_char
    assert_equal 'k', @enigma_1.rotate_char('h', 3)
    assert_equal 'm', @enigma_1.rotate_char('r', -5)
    assert_equal 'i', @enigma_1.rotate_char('x', 12)
  end

  def test_generate_key_hash
    output = {
      'a' => 10,
      'b' => 12,
      'c' => 4,
      'd' => 18
    }
    assert_equal output, @enigma_1.generate_key_hash('01012', '220894')
  end

  def test_generate_keys_array
    keys_arr = [
      'a', 'b', 'c', 'd',
      'a', 'b', 'c', 'd',
      'a', 'b', 'c']

    assert_equal keys_arr, @enigma_1.generate_keys_array('hello world')
  end

  def test_encrypt_decrypt_helper
    assert_equal 'hello world', @enigma_1.encrypt_decrypt_helper('rqpcyl faxh','01012','220894',false)
    assert_equal 'rqpcyl faxh', @enigma_1.encrypt_decrypt_helper('hello world','01012','220894')
  end
end
