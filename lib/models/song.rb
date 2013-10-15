class Song
  attr_accessor :name, :genre, :artist
  def genre=(genre)
    @genre = genre
    #self.artist.genres << song.genre
    genre.songs << self
  end
end 