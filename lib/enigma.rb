class Enigma
  attr_reader :char_set
  def initialize
    @char_set = ('a'..'z').to_a << ' '
  end

  def encrypt(phrase, key, date)
    ciphertext = self.encrypt_decrypt_helper(phrase, key, date)
    {
      :encryption => ciphertext,
      :key => key,
      :date => date
    }
  end

  def decrypt(phrase, key, date)
    ciphertext = self.encrypt_decrypt_helper(phrase, key, date, false)
   {
      :decryption => ciphertext,
      :key => key,
      :date => date
    }
  end

  def encrypt_decrypt_helper(phrase, key, date, encrypt=true)
    keys = self.generate_key_hash(key, date)
    split_phrase = phrase.split(//)
    keys_arr = self.generate_keys_array(split_phrase)
    if encrypt
      ciphertext = split_phrase.map.with_index do |char, i|
        self.rotate_char(char, keys[keys_arr[i]])
      end
    else
      ciphertext = split_phrase.map.with_index do |char, i|
        self.rotate_char(char, -keys[keys_arr[i]])
      end
    end
    ciphertext.join
  end

  def generate_keys_array(split_phrase)
    mod = (split_phrase.length % 4)
    keys_arr = (@char_set[0..3]).cycle((split_phrase.length - mod) / 4).map{|c|c}
    keys_arr << @char_set.first(mod)
    keys_arr.flatten
  end

  def get_date_shift(date)
    squared = date.to_i * date.to_i
    squared.to_s.split(//).map{|num| num.to_i}.last(4)
  end

  def get_raw_keys(key)
    split_key = Array.new
    key.split(//).map{|num| num.to_i}.each_cons(2){|num_set| split_key << num_set}
    split_key.map {|num_set| num_set.join.to_i}
  end

  def get_keys(key, date)
    raw_keys = self.get_raw_keys(key)
    date_shift = self.get_date_shift(date)
    keys = raw_keys.map.with_index {|num, i| num += date_shift[i]}
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
    return char if !i
    rot_arr = @char_set.rotate(amt)
    rot_arr[i]
  end
end
