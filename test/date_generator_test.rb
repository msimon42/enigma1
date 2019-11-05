require_relative '../lib/date_generator'
require_relative 'test_helper'

class DateGeneratorTest < Minitest::Test
  def test_generate
    assert_equal Time.now.strftime("%d%m%y"), DateGenerator.generate
  end
end
