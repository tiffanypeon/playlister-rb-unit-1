require_relative "../../config/environment.rb"
require 'pp'
class Parser

  def initialize(path)
    @path = path
  end

  def call
    Dir.foreach('../../db/data') do |x|
      next if x.start_with?(".") 
      splitter(x)
      create_song
    end
  end

  def splitter(string)
    @split_array = string.scan(/(.*) - (.*) \[(.*)\]\.mp3/).first
  end

  # def create_artist
  #   artist_name = @split_array[0]
  #   Artist.new.tap {|x| x.name= artist_name}
  # end

  def create_song
    artist_name = @split_array[0]
    song_title = @split_array[1]
    genre_name = @split_array[2]
    s = Song.new.tap {|x| x.name = song_title}
    s.genre = Genre.new.tap {|x| x.name = genre_name}
    # unless @@artists.include?(self)
    Artist.new.tap {|x| x.add_song(s); x.name = artist_name}
  end

  def create_genre
    genre_name = @split_array[2]
    
  end

end 

parser= Parser.new('path')
parser.call
Artist.all.each {|x| puts x.name}
# Song.all.each {|x| puts x.name}
# pp Genre.all 