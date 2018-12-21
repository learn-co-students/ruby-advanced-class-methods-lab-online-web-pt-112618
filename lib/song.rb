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
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(string)
    song = self.new
    @name = string
    song.name = string
    song.save
    song
  end
  
  def self.create_by_name(string)
    self.new_by_name(string)
  end
  
  def self.find_by_name(string)
    @@all.find {|item| item.name == string}
  end 
  
  def self.find_or_create_by_name(string)
    self.find_by_name(string) || self.create_by_name(string)
    
    # if self.find_by_name(string) == true
    #   @@all.find_all do |item| 
    #     item if item.name == string
    #   end
    # else 
    #   self.create_by_name(string)
    # end
  end
    
  def self.alphabetical 
    @@all.sort_by {|item| item.name }
  end
    
  def self.new_from_filename(filename)
    song = Song.new
    filename_arr = filename.split(/[\-\.]/).map {|w| w.strip}
    song.name = filename_arr[1]
    song.artist_name = filename_arr[0]
    song
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
end
