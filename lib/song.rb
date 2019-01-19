class Song
  @@all = []
  attr_accessor :artist_name, :name

  def initialize
   
  end

  def self.create
    @song = self.new
    @@all << @song
    @song
  end
  
  def self.all
    @@all
  end
 
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
 
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end
  
  def self.find_by_name(song_name)
    var = nil
    @@all.each do |song|
      if song.name == song_name
        var = song
             end
      
    end
    var
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  

  def self.create_from_filename(new_song)
      song_array = new_song.split("-"|| ".")
      song = song_array[1]
      @artist_name = song_array[0]
  end
  
  def self.new_from_filename(song_name)
    title = song_name.split(" - ")
    song = self.create_by_name(title[1].gsub(".mp3", ""))
    song.artist_name = title[0]
    song 
  end  
  
  def self.create_from_filename(title)
    new = title.split(" - ")
    song = self.create_by_name(new[1].gsub(".mp3", ""))
    song.artist_name = new[0]
    song
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end
  
   def self.destroy_all
    @@all.clear
  end
  
  
end
