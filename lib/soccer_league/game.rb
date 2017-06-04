class Game

  attr_reader :team_one, :team_two, :team_one_score, :team_two_score

  def initialize(team_one_with_score, team_two_with_score)
    @team_one_score = team_one_with_score.pop.to_i
    @team_two_score = team_two_with_score.pop.to_i

    @team_one = Team.find_or_create_by_name(team_one_with_score.join(" "))
    @team_two = Team.find_or_create_by_name(team_two_with_score.join(" "))
  end

  def play
    if @team_one_score == @team_two_score
      @team_one.points += 1
      @team_two.points += 1
    elsif @team_one_score > @team_two_score
      @team_one.points += 3
    else
      @team_two.points += 3
    end
  end

  def self.parse_games(file)
    file.each do |line|
      begin
        teams = line.split(", ")
        team_one_with_score = teams[0].split(" ")
        team_two_with_score = teams[1].split(" ")
        game = self.new(team_one_with_score, team_two_with_score)
        game.play
      rescue
        puts "Sorry, this file isn't formatted correctly! Try running with a different file"
        abort
      end
    end
  end
end
