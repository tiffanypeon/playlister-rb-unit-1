class Genre
  attr_accessor :name, :songs, :artists

  @@genres = []
  
  def initialize
    @songs = []
    @artists = []
    @@genres << self
  end
  
  def self.count
    @@genres.count
  end
  
  def self.reset_genres
    @@genres.clear
  end
  
  def self.all
    @@genres
  end

  def self.find(name)
    @@genres.select do |genre|
      name == genre.name
    end.first
  end 
end