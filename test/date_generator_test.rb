require_relative '../lib/date_generator'
require_relative 'test_helper'

class DateGeneratorTest < Minitest::Test
  def test_generate
    assert_equal '041119', DateGenerator.generate
  end   
end
