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

  def encrypt
    @output = @enig.encrypt(@phrase, @key, @date)
  end

  def self.run
    new = self.new
    new.user_input
    new.read_file
    new.encrypt
    new.write_to_file
  end
end

Encrypt.run
