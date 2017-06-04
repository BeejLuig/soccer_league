class Parser
  def initialize

  end

  def parse(file_path)
    file = File.new(file_path)
    file.each do |line|
      puts line
    end
  end

end
