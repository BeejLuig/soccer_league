class CLI

  def initialize
  end

  # method to handle CLI
  def call
    puts "Welcome to Soccer League!"
    file = nil
    # loop over input flow until a valid file is given
    while file.nil?
      begin
        puts "Please enter the full pathname of your text file"
        puts "Type 'q' to quit"
        file = handle_input
      rescue
        # give helpful message if filepath raises error
        puts "Sorry, that's not a valid filepath!"
      end
    end

    Game.parse_games(file)
    display_league_rankings
  end

  private

  def handle_input
    # aborts if 'q'
    # else, try to create new File
    input = gets.chomp.downcase
    input == 'q' ? abort : File.new(input)
  end

  def display_league_rankings
    league_rankings = Team.league_rankings
    # previous_rank to 0
    previous_rank = 0
    # iterate over teams to find correct rank
    league_rankings.each_with_index do |team, i|
      # starting with the 2nd team
      # check current team's points against the team above
      # if current team's points == prev team's points
      if i > 0 && team.points == league_rankings[i-1].points
      # current team gets the same rank as prev team
        rank = previous_rank
      else
      # otherwise, set rank and prev_rank to index + 1
        rank = i+1
        previous_rank = i+1
      end
      # formatted rank statement
      puts "#{rank}. #{team.name}, #{team.points} #{team.points == 1 ? 'pt':'pts'}"
    end
  end

end
