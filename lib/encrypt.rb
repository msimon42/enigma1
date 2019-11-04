class Encrypt
  def initialize
    @enig = Enigma.new
  end

  def user_input
    puts 'Please enter a filename: '
    @filename = gets.chomp
    puts "If you would like to provide a key, please do so here. Otherwise type 'skip'."
    @key = gets.chomp
    puts "Please enter a date, or type 'skip' to use today's date."
    @date = gets.chomp
  end
    
end
