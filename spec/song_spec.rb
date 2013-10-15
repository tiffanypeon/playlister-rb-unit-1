require_relative '../config/environment.rb'

describe "Song" do
  it "can initialize a song" do
    new_song = Song.new
    new_song.should be_an_instance_of(Song)
    #pending #implement this spec
  end

  it "can have a name" do
    new_song = Song.new.tap{|s| s.name = "Like a Rolling Stone"}
    new_song.name.should eq("Like a Rolling Stone")
  end

  it "can have a genre" do
    new_song = Song.new.tap{|s| s.genre = Genre.new.tap{|g| g.name = "Rock"}}
    new_song.genre.name.should eq("Rock")
  end

  it "has an artist" do
    new_song = Song.new.tap{|s| s.artist = "Bob Dylan"}
    new_song.artist.should eq("Bob Dylan")    
  end
end