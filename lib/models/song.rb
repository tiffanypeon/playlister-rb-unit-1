class Song
  attr_accessor :name, :genre, :artist
  
  @@songs = []

  def genre=(genre)
    @genre = genre
    #self.artist.genres << song.genre
    genre.songs << self
    @@songs << self
  end

  def self.all
    @@songs
  end

  def self.find
    @@songs.select do |song|
      name == song.name
    end.first
  end
end 