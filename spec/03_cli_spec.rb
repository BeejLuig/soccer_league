require "spec_helper"

RSpec.describe CLI do
  describe "class methods" do
    describe ".call" do

    end
  end

  describe "private methods" do
    #tests only pass if private keyword is removed from cli.rb
    before(:example) do
      @cli = CLI.new
    end
    describe "handle_input" do
      it "returns a File when given a correct filepath" do
        $stdin = StringIO.new
        $stdin.puts("spec/sample-input.txt")
        $stdin.rewind
        expect(@cli.handle_input.class).to eq(File)
      end

      it "aborts if given input of 'q'" do
        $stdin = StringIO.new
        $stdin.puts("q")
        $stdin.rewind
        expect(@cli.handle_input.class).to eq(abort)
      end
    end

    describe "display_league_rankings" do
      it "prints all teams in ranked order" do
        Team.all.clear
        allow($stdout).to receive(:puts)
        Game.parse_games(File.new("spec/sample-input.txt"))
        expect($stdout).to receive(:puts).with("1. Tarantulas, 6 pts")
        expect($stdout).to receive(:puts).with("2. Lions, 5 pts")
        expect($stdout).to receive(:puts).with("3. FC Awesome, 1 pt")
        expect($stdout).to receive(:puts).with("3. Snakes, 1 pt")
        expect($stdout).to receive(:puts).with("5. Grouches, 0 pts")
        CLI.new.display_league_rankings

        Team.all.clear
        allow($stdout).to receive(:puts)
        Game.parse_games(File.new("spec/sample-input-2.txt"))
        expect($stdout).to receive(:puts).with("1. Bears, 4 pts")
        expect($stdout).to receive(:puts).with("1. Raccoons, 4 pts")
        expect($stdout).to receive(:puts).with("3. Cats, 3 pts")
        expect($stdout).to receive(:puts).with("4. Dogs, 0 pts")
        CLI.new.display_league_rankings
      end
    end
  end
end
