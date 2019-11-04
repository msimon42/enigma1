require 'pry'
require_relative 'enigma'
class Encrypt
  attr_reader :key
  def initialize
    @enig = Enigma.new
  end

  def user_input
    puts 'Please enter a filename that contains your message: '
    @filename = gets.chomp
    puts 'Please enter a filename to save your encrypted message: '
    @outfilename = gets.chomp
  end

  def generate_key
    KeyGenerator.generate
  end

  def generate_date
    DateGenerator.generate
  end

  def read_file
    file = File.open(@filename)
    file_data = file.readlines.map(&:chomp)
    @phrase = file_data[0]
    @key = file_data[1]
    @date = file_data[2]
  end

  def encrypt
    @output = @enig.encrypt(@phrase, @key, @date)
  end

  def write_to_file
    File.open(@outfilename, 'w') {|file| file.write @output}
  end
end

encrypt = Encrypt.new
encrypt.user_input
encrypt.read_file
