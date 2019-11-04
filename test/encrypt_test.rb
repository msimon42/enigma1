require_relative 'test_helper'
require_relative '../lib/enigma'

class EncryptTest < Minitest::Test
  def setup
    @encrypt = Encrypt.new
  end

  def test_existence
    assert_instance_of Encrypt, @encrypt
  end

end
