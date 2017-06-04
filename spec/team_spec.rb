require "spec_helper"

RSpec.describe SoccerLeague::Team do

  describe "instance methods" do
    describe "#initialize" do
      it "instantiates a new Team with a name" do
        # TODO:
      end
    end

    describe "#name" do
      it "returns the name of the team" do
        # TODO:
      end
    end

  end

  describe "class methods" do

    describe ".all" do
      it "returns an array of all the teams" do
        # TODO:
      end
    end

    describe "find_or_create_by_name" do
      context "if the passed team name doesn't exist" do
        it "creates a new Team and returns it" do
          # TODO: 
        end
      end

      context "if the passed team already exists" do
        it "returns the team with the given name" do
          # TODO:
        end
      end
    end
  end

end
