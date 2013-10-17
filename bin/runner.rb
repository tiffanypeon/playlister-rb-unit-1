require_relative '../config/environment.rb'

p = Parser.new('')
p.call

@artists = Artist.all
@genres = Genre.all
@songs = Song.all

g = SiteGenerate.new
g.generate