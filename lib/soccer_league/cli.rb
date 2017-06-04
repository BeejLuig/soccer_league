class CLI

  def initialize
  end

  def call
    puts "Welcome to Soccer League!"
    file = nil
    while file.nil?
      begin
        file = handle_input
      rescue
        puts "Sorry, that's not a valid filepath!"
      end
    end
    Game.parse_games(file)
    display_league_rankings
  end

  private

  def handle_input
    puts "Please enter the full pathname to your input text file"
    puts "Type 'q' to quit"
    input = gets.chomp.downcase
    input == 'q' ? abort : File.new(input)
  end

  def display_league_rankings
    league_rankings = Team.league_rankings
    previous_rank = 0
    league_rankings.each_with_index do |team, i|
      if i > 0 && team.points == league_rankings[i-1].points
        puts "#{previous_rank}. #{team.name}, #{team.points} pts"
      else
        puts  "#{i+1}. #{team.name}, #{team.points} pts"
        previous_rank = i+1
      end
    end
  end

end
