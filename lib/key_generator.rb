class KeyGenerator
  def self.generate
    (sprintf '%05d', rand(9999)).to_s
  end
end
