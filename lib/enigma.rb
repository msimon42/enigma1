require 'pry'
class Enigma
  attr_reader :char_set
  def initialize
    @char_set = ('a'..'z').to_a << ' '
  end

  def encrypt(phrase, key, date)
    keys = self.generate_key_hash(key, date)
    split_phrase = phrase.split(//)
    mod = (split_phrase.length % 4)
    keys_arr = Array.new

    (@char_set[0..3]).cycle((split_phrase.length - mod) / 4) do |char|
      keys_arr << char
    end
    keys_arr << @char_set.first(mod)
    real_keys = keys_arr.flatten
    ciphertext = Array.new
    split_phrase.each_with_index do |char, i|
      ciphertext << self.rotate_char(char, keys[real_keys[i]])
    end
    output = {
      :ciphertext => ciphertext.join,
      :key => key,
      :date => date
    }
  end

  def decrypt(phrase, key=nil, date=nil)

  end

  def generate_keys_array(phrase)

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

  def generate_key_hash(key, date)
    output = Hash.new
    full_key = self.get_keys(key, date)
    letters = @char_set[0..3]
    full_key.each_with_index {|num, i| output[letters[i]] = num}
    output
  end

  def rotate_char(char, amt)
    i = @char_set.find_index(char)
    rot_arr = @char_set.rotate(amt)
    replacement_char = rot_arr[i]
  end
end
