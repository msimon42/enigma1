require_relative 'test/helper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma_1 = Enigma.new
  end   
end
