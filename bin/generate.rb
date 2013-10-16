require_relative '../config/environment.rb'
require 'erb'
require 'youtube_search'

class SiteGenerate

  def generate
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
  end

end

p = Parser.new('')
p.call

@artists = Artist.all
@genres = Genre.all

g = SiteGenerate.new
g.generate