class Parser

  def initialize(path)
    @path = path
  end

  #def call / end
  #should go in and say "open the file system" 
  #"get a list of every song"
  #fore ver song (each), call splitter on the name of the song 
  #create artist on artist in array and same for genre
  #at the end of this we have the artist, song genre models filled out 

  def splitter(string)
    @split_array = string.scan(/(.*) - (.*) \[(.*)\]\.mp3/).first
  end

  def create_artist
    artist_name = @split_array[0]
  end

  def create_song
    song_title = @split_array[1]
  end

  def create_genre
    genre_name = @split_array[2]
  end

end 