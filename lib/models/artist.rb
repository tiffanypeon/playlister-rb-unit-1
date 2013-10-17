class Artist
  attr_accessor :name, :songs, :genres 
  @@artists = []
  def initialize
    @songs = []
    @genres = []
    @@artists << self
  end

  def add_song(song)
    song.artist = self
    self.songs << song
    self.genres << song.genre
    if !song.genre.artists.include?(self)
      song.genre.artists << self
    end
  end

  def self.all
    @@artists
  end

  def self.reset_artists
    @@artists.clear 
  end    

  def self.count
    @@artists.count
  end

  def self.find(name)
    @@artists.select do |artist|
      name == artist.name
    end.first
  end
end