class Song
  attr_accessor :name, :genre, :artist
  
  @@song = []

  def genre=(genre)
    @genre = genre
    #self.artist.genres << song.genre
    genre.songs << self
    @@song << self
  end

  def self.all 
    @@song
  end
end 