require_relative 'key_generator'
require_relative 'date_generator'
class FileReader
  def self.user_input
    puts 'Please enter a filename that contains your message: '
    filename = gets.chomp
    puts 'Please enter a filename to save your encrypted message: '
    outfilename = gets.chomp
    file_names = [filename, outfilename]
  end

  def self.read_file(filename)
    file = File.open(filename)
    file_data = file.readlines.map(&:chomp)
    file_data[1] ||= KeyGenerator.generate
    file_data[2] ||= DateGenerator.generate
    file_data
  end

  def self.write_to_file(filename, message)
    File.open(filename, 'w') {|file| file.write message}
  end
end
