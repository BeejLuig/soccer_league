class Parser
  def initialize

  end

  def parse(file_path)
    file = File.new(file_path)
    file.each do |line|
      teams = line.split(", ")
      team_one_with_score = teams[0].split(" ")
      team_two_with_score = teams[1].split(" ")
      game = Game.new(team_one_with_score, team_two_with_score)
      game.play
    end
  end

end
