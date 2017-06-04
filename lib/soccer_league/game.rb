class Game

  def initialize(team_one_with_score, team_two_with_score)
    @team_one = Team.find_or_create_by_name(team_one_with_score[0])
    @team_two = Team.find_or_create_by_name(team_two_with_score[0])

    @team_one_score = team_one_with_score[1].to_i
    @team_two_score = team_two_with_score[1].to_i
  end

  def play
    if @team_one_score == @team_two_score
      @team_one.points += 1
      @team_two.points += 1
      puts "It's a tie!"
    elsif @team_one_score > @team_two_score
      @team_one.points += 3
      puts "#{@team_one.name} win!"
    else
      @team_two.points += 3
      puts "#{@team_two.name} win!"
    end
  end
end
