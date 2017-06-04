require "spec_helper"

RSpec.describe SoccerLeague do
  it "has a version number" do
    expect(SoccerLeague::VERSION).not_to be nil
  end
end
