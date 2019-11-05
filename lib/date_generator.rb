class DateGenerator
  def self.generate
    Time.now.strftime("%d%m%y")
  end
end
