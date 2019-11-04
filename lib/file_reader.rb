module FileReader
  def read_file
    file = File.open(@filename)
    file_data = file.readlines.map(&:chomp)
  end

  def write_to_file
    File.open(@outfilename, 'w') {|file| file.write @output}
  end
end
