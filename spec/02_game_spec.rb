require "spec_helper"

RSpec.describe Game do
  describe "instance methods" do
    describe "#initialize" do
      before(:example) do
        @game = Game.new(%w(Tarantulas 3), %w(FC Awesome 2))
      end
      it "initializes with two teams and scores" do
        expect(@game.team_one.name).to eq("Tarantulas")
        expect(@game.team_two.name).to eq("FC Awesome")
        expect(@game.team_one_score).to eq(3)
        expect(@game.team_two_score).to eq(2)
      end
    end

    describe "#play" do
      before(:context) do
        @team_one_wins = Game.new(%w(A 3), %w(B 2))
        @team_two_wins = Game.new(%w(C 1), %w(D 3))
        @teams_tie = Game.new(%w(E 1), %w(F 1))
      end
      it "gives 3 points to the winning team" do
        @team_one_wins.play
        expect(@team_one_wins.team_one.points).to eq(3)
        @team_two_wins.play
        expect(@team_two_wins.team_two.points).to eq(3)
      end

      it "gives 1 points to both teams if there is a tie" do
        @teams_tie.play
        expect(@teams_tie.team_one.points).to eq(1)
        expect(@teams_tie.team_two.points).to eq(1)
      end
    end
  end

  describe "class methods" do

    describe ".parse_games" do
      it "accepts a file as an arg and plays a game for each line" do
        Team.all.clear
        file = File.new("./spec/sample-input.txt")
        Game.parse_games(file)
        expect(Team.all.length).to eq(5)
      end
    end
  end
end
