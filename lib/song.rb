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
 song1=self.new
  @@all<<song1
  return song1
end

def name
@name
end

def self.new_by_name(name)
song1=self.new
 song1.name=name
 @@all<<song1
 return song1
 
end

def self.create_by_name(name)
 song1=self.new
 song1.name=name
 @@all<<song1
 return song1
end

def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

def self.find_or_create_by_name(name)
   if (Song.find_by_name(name)!=nil)
   return Song.find_by_name(name)
 else
 song1=Song.create_by_name(name)
  return song1
 end
  end

def self.alphabetical
@@all.sort_by {|row| row.name}
end

def self.new_from_filename (word)

    
      data = word.split(" - ")
      artist = data[0]
      mp3 = data[1]
      data2=mp3.split(".")
      name=data2[0]
      
 
      song = self.new 
      song.name = name
      song.artist_name = artist
      song
 
end

def self.create_from_filename (word)

    song=Song.new_from_filename(word)
@@all << song
end

def self.destroy_all 
@@all.clear
end
end
