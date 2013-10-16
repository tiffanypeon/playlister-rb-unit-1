require_relative '../config/environment.rb'
require 'erb'
require 'youtube_search'

class SiteGenerate

  def generate
    artist_index = ERB.new(File.open('lib/views/artist_index.erb').read)

    File.open('_site/artists.html', 'w+') do |f|
      f << artist_index.result
    end

    p "created artist index"

    genre_index = ERB.new(File.open('lib/views/genre_index.erb').read)

    File.open('_site/genres.html', 'w+') do |f|
      f << genre_index.result
    end
    
    p "created genre index"

    artist_profile = ERB.new(File.open('lib/views/artist_profile.erb').read)

    Artist.all.each do |artist_object|
      File.open("_site/artists/#{artist_object.name.gsub(' ', '_')}.html", 'w+') do |f|
        f << artist_profile.result(binding)
      end
    end

    p "created all artist pages"
  end

end