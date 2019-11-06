require_relative 'test_helper'
require_relative '../lib/file_reader'

class FileReaderTest < Minitest::Test
  def test_read_file
    file_data = FileReader.read_file('test_phrase.txt')

    assert_equal file_data, ['i gave birth to twin wire hangovers!', '03726', '220894']
  end

  def test_read_file_without_keys
    file_data = FileReader.read_file('test_random_keys_phrase.txt')

    assert_equal file_data[0], 'i gave birth to twin wire hangovers'
    assert file_data[1]
    assert file_data[2]
  end
end
