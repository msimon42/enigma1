require_relative 'test/helper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma_1 = Enigma.new
  end

  def test_existence
    assert_instance_of Enigma, @enigma_1
  end     
end
