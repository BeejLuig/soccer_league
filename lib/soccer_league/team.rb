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
    team = self.all.bsearch {|team| name == team.name}
    team.nil? ? self.new(name) : team
  end
end
