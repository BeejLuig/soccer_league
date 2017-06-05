class Team
  attr_accessor :name, :points

  @@all = []

  def initialize(name)
    @name = name
    @points = 0
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    team = self.all.find {|team| name == team.name}
    team.nil? ? self.new(name) : team
  end

  def self.league_rankings
    # sort by name if points match
    # otherwise, sort by points
    @@all.sort do |a, b|
      a.points == b.points ? a.name <=> b.name : b.points <=> a.points
    end
  end
end
