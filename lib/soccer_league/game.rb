class Game

  attr_reader :team_one, :team_two, :team_one_score, :team_two_score

  def initialize(team_one, team_one_score, team_two, team_two_score)
    @team_one = Team.find_or_create_by_name(team_one)
    @team_two = Team.find_or_create_by_name(team_two)

    @team_one_score = team_one_score
    @team_two_score = team_two_score
  end

  def play
    if @team_one_score == @team_two_score
      # in the event of a tie
      # both teams get 1 point
      @team_one.points += 1
      @team_two.points += 1
    elsif @team_one_score > @team_two_score
      # if team one wins, they get 3 points
      @team_one.points += 3
    else
      # last possibility
      # team two gets 3 points for winning
      @team_two.points += 3
    end
  end

  def self.parse_games(file)
    # go line by line
    file.each do |line|
      # split string in half
      teams = line.split(", ")

      # break each team into an array
      team_one_with_score = teams[0].split(" ")
      team_two_with_score = teams[1].split(" ")

      # set score to last element in each team array
      # and pop
      team_one_score = team_one_with_score.pop.to_i
      team_two_score = team_two_with_score.pop.to_i

      # set team name to remainder strings in array
      # in case a team name has more than one word
      team_one = team_one_with_score.join(" ")
      team_two = team_two_with_score.join(" ")

      # instantiate new game with team names and scores
      game = self.new(team_one, team_one_score, team_two, team_two_score)
      game.play
    end
  end
end
