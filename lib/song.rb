class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    self.new.save #returns a new instance of song, saves and returns it.
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name).nil? ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      # binding.pry
      song.name
    end
  end
  #
  # def artist_name=(name)
  #   @artist_name = name
  # end



  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    pull_song_name = filename.split(" - ")[1]
    song_name = pull_song_name.slice(0...(pull_song_name.index('.')))
    new_song = self.create_by_name(song_name)
    # binding.pry
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
