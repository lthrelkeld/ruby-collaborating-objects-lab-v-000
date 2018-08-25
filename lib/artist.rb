require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  #returns and artist instance w/ the given name (either found or new)
  def self.find_or_create_by_name(name)
    if self.all.find{|person| person.name == name} != nil
      self.all.find{|person| person.name == name}
    else
      Artist.new(name)
    end
  end

  def print_songs
    print self.songs
    binding.pry
  end

end
