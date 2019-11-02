require 'pry'
class Enigma
  attr_reader :char_set
  def initialize
    @char_set = ('a'..'z').to_a << ' '
  end

  def encrypt(phrase, key=nil, date=nil)

  end

  def decrypt(phrase, key=nil, date=nil)

  end

  def get_date_shift(date)
    squared = date.to_i * date.to_i
    shift_arr = squared.to_s.split(//).map{|num| num.to_i}.last(4)
  end

  def get_raw_keys(key)
    split_key = Array.new
    raw_keys = Array.new
    key.split(//).map{|num| num.to_i}.each_cons(2){|num_set| split_key << num_set}
    keys = split_key.map do |num_set|
      num_set.join.to_i
    end
  end

  def get_keys(key, date)
    raw_keys = self.get_raw_keys(key)
    date_shift = self.get_date_shift(date)
    keys = Array.new
    raw_keys.each_with_index do |num, i|
      keys << num += date_shift[i]
    end
    keys
  end
end
