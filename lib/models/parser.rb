require_relative "../../config/environment.rb"
require 'pp'
class Parser

  def initialize(path)
    @path = path
  end

  def call
    Dir.foreach('db/data') do |string|
      next if string.start_with?(".") 
      create_song(splitter(string))
    end
  end

  def splitter(string)
    string.scan(/(.*) - (.*) \[(.*)\]\.mp3/).first
  end

  # def create_artist
  #   artist_name = @split_array[0]
  #   Artist.new.tap {|x| x.name= artist_name}
  # end

  def create_song(split_array)
    artist_name = split_array[0]
    song_title = split_array[1]
    genre_name = split_array[2]

    s = Song.new.tap {|x| x.name = song_title}

    s.genre = Genre.find(genre_name) || Genre.new.tap {|x| x.name = genre_name}

    artist = Artist.find(artist_name) || Artist.new.tap {|x| x.name = artist_name}
    artist.add_song(s)
  end

  def create_genre
    genre_name = split_array[2]
    
  end

end 

# parser= Parser.new('path')
# parser.call
# Artist.all.each {|x| puts x.name}
# Song.all.each {|x| puts x.name}
# pp Genre.all 