class Encrypt
  attr_reader :key
  def initialize
    @enig = Enigma.new
  end

  def user_input
    puts 'Please enter a filename that contains your message: '
    @filename = gets.chomp
    puts 'Please enter a filename to save your encrypted message: '
    @outfile = gets.chomp
  end

  def generate_key
    if @key == 'skip'
      return @key = KeyGenerator.generate
    end
  end

  def generate_date
    if @date == 'skip'
      return @date = DateGenerator.generate
    end
  end

  def encrypt




end
