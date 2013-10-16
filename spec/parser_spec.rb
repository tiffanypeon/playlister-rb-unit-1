require 'pp'
require_relative "../config/environment.rb"

describe "Parser" do

  it "can be initialized" do
    path = "test_path"
    Parser.new(path).should be_an_instance_of(Parser)
  end

  it "should take a string and split it correctly" do
    pending
    string = "ASAP Rocky - Peso [dance].mp3"
    path = "test_path"
    parser = Parser.new(path)
    parser.splitter(string).should eq(["ASAP Rocky", "Peso", "dance"])
  end

  it "should take artist name from the split array" do
    pending
    string = "ASAP Rocky - Peso [dance].mp3"
    path = "test_path"
    parser = Parser.new(path)
    parser.splitter(string).should eq(["ASAP Rocky", "Peso", "dance"])
    parser.create_artist.should eq("ASAP Rocky")
  end

  it "should take the song title from the split array " do
    pending
    string = "ASAP Rocky - Peso [dance].mp3"
    path = "test_path"
    parser = Parser.new(path)
    parser.splitter(string).should eq(["ASAP Rocky", "Peso", "dance"])
    parser.create_song
    pp Artist.all
    pp Song.all
    pp Genre.all
    end

  it "should take the genre from the split array" do 
    pending
    string = "ASAP Rocky - Peso [dance].mp3"
    path = "test_path"
    parser = Parser.new(path)
    parser.splitter(string).should eq(["ASAP Rocky", "Peso", "dance"])
    parser.create_genre.should eq("dance")
  end

  # it "can be called" do 
  #   pending
  #   # path = "test_path"
  #   # Parser.new(path)
  #   # Artist.all.first.songs.name.should include("Peso")
  # end


end
