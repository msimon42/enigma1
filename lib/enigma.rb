class Enigma
  attr_reader :char_set
  def initialize
    @char_set = ('a'..'z').to_a << ' '
  end

  def encrypt(phrase, key=nil, date=nil)

  end

  def decrypt(phrase, key=nil, date=nil)

  end

  def shift(phrase, key=nil, date=nil)

  end       
end
