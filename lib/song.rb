require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new #instantiating creates a new instance is saved to variable song
    song.save # saves the instance into the array
    song #returns to instance
  end

  def self.new_by_name(song_name)#takes in a string name of the song
    song = self.new #creates an instance of a song saved to son variable
    song.name = song_name #.name is an attribute that is equal to the string
    song #returns the sing instance
  end

  def self.create_by_name(name)#takes in the string name of a song
    song = self.new
    song.name = name
    song.save
    song
    #returns a song instance with that name set as its name property
    # the song saved in @@all variable
  end
#binding.pry
  def self.find_by_name(name) #accepts the string name of a song
    self.all.find {|song| song.name == name}#returns the matching instance of the song with that name.
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
#binding.pry
    self.all.sort_by {|song_obj| song_obj.name }
  end

  def self.new_from_filename(filename) #This is splitting the file name to create a new instance
#binding.pry
    data = filename.split(" - ") #split data into an array called 'data'
    artist_name = data[0] #calls in the element of the array with the name
    song_name = data[1].gsub(".mp3","") #removes things from the file name to pass just the name

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1].gsub(".mp3","")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
