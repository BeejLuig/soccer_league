require "spec_helper"
require "pry"
RSpec.describe Team do

  describe "instance methods" do

    describe "#initialize" do
      before(:context) do
        @team = Team.new("Bears")
      end
      it "initializes a new Team with a name" do
        expect(@team.name).to eq("Bears")
      end

      it "initializes a new Team with zero points" do
        expect(@team.points).to eq(0)
      end
    end
  end

  describe "class methods" do

    describe ".all" do
      it "returns an array of all the teams" do
        expect(Team.all.length).to eq(1)
        Team.new("Cats")
        expect(Team.all.length).to eq(2)
      end
    end

    describe "find_or_create_by_name" do
      context "if the passed team name doesn't exist" do
        it "creates a new Team and returns it" do
          team = Team.find_or_create_by_name("Dogs")
          expect(Team.all[-1]).to eq(team)
        end
      end

      context "if the passed team already exists" do
        it "returns the team with the given name" do
          team = Team.find_or_create_by_name("Bears")
          expect(team).to eq(Team.all.first)
        end
      end

    end

    describe "league_rankings" do
      it "returns teams in order of points, high to low" do
        points = 0
        Team.all.each do |team|
          team.points = points
          points += 1
        end
        expect(Team.league_rankings.first.points).to eq(2)
        expect(Team.league_rankings.last.points).to eq(0)
      end

      it "orders teams alphabetically if they have the same number of points" do
        Team.all.each do |team|
          team.points = 0
        end
        expect(Team.league_rankings.first.name).to eq("Bears")
        expect(Team.league_rankings.last.name).to eq("Dogs")
      end
    end
  end

end
