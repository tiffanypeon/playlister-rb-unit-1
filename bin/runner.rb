require_relative '../config/environment.rb'

p = Parser.new('')
p.call

@artists = Artist.all
@genres = Genre.all

g = SiteGenerate.new
g.generate