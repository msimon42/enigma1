require_relative 'file_reader'
require_relative 'enigma'
class Decryptor
  def self.decrypt
    @enig = Enigma.new
    file_names = FileReader.user_input
    file_data = FileReader.read_file(file_names[0])
    output = @enig.decrypt(file_data[0], file_data[1], file_data[2])
    FileReader.write_to_file(file_names[1], output.values)
  end
end
