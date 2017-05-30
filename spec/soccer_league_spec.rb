require "spec_helper"

RSpec.describe SoccerLeague do
  it "has a version number" do
    expect(SoccerLeague::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
