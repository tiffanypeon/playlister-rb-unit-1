class Artist
  attr_accessor :name, :songs, :genres 
  @@artists = []
  def initialize(artist_name)
    @songs = []
    @genres = []
    @name = artist_name
      if @@artists.count == 0 
        @@artists << self
      else 
        @@artists.each do |x| 
        @@artists << self unless x.name == self.name
      end
    end
  end 

  def add_song(song)
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
end