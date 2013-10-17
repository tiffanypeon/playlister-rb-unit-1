require_relative '../config/environment.rb'
require 'erb'
require 'youtube_search'

class SiteGenerate

  def generate
    index = ERB.new(File.open('lib/views/index.erb').read)

    File.open('_site/index.html', 'w+') do |f|
      f << index.result
    end

    artist_index = ERB.new(File.open('lib/views/artist_index.erb').read)

    File.open('_site/artists.html', 'w+') do |f|
      f << artist_index.result
    end

    genre_index = ERB.new(File.open('lib/views/genre_index.erb').read)

    File.open('_site/genres.html', 'w+') do |f|
      f << genre_index.result
    end   

    artist_profile = ERB.new(File.open('lib/views/artist_profile.erb').read)

    Artist.all.each do |artist_object|
      File.open("_site/artists/#{artist_object.name.gsub(' ', '_')}.html", 'w+') do |f|
        f << artist_profile.result(binding)
      end
    end

    genre_profile = ERB.new(File.open('lib/views/genre_profile.erb').read)

    Genre.all.each do |genre_object|
      File.open("_site/genres/#{genre_object.name.gsub(' ', '_')}.html", 'w+') do |f|
        f << genre_profile.result(binding)
      end
    end

    song_index = ERB.new(File.open('lib/views/song_index.erb').read)

    File.open('_site/songs.html', 'w+') do |f|
      f << song_index.result
    end  

    song_profile = ERB.new(File.open('lib/views/song_profile.erb').read)

    Song.all.each do |song_object|
      File.open("_site/songs/#{song_object.name.gsub(' ', '_')}.html", 'w+') do |f|
        f << song_profile.result(binding)
      end
    end 

  end

end