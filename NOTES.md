
 teams = line.split(", ")

 team_one_with_score = teams[0].split(" ")
 team_two_with_score = teams[1].split(" ")

 team_one = Team.find_or_create_by_name(team_one_with_score[0])
 team_one_score = team_one_with_score[1]
 team_two = Team.find_or_create_by_name(team_two_with_score[0])
 team_two_score = team_two_with_score[1]

 game = Game.new(team_one, team_one_score, team_two, team_two_score)
