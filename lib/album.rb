class Album

  attr_accessor :name, :id, :year, :genre, :artist, :status

  @@albums = {}
  @@total_rows = 0
  @@sold_albums = {}

  def initialize(name, id, year, genre, artist, status)
    @name = name
    @id = id || @@total_rows += 1
    @year = year
    @genre = genre
    @artist = artist
    @status = "available"
  end

  def self.all()
    @@albums.values().sort { |a, b| a.name.downcase <=> b.name.downcase }
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist, self.status)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.search_name(name)
    @@albums.values().select { |album| /#{name}/i.match? album.name }
  end

  def update(name, year, genre, artist)
    # @name = name
    # @year = year
    # @genre = genre
    # @artist = artist
    self.name = name
    self.year = year
    self.genre = genre
    self.artist = artist
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist, self.status)
  end

  def delete()
    @@albums.delete(self.id)
  end

  def sold()
    self.status = "sold"
    @@sold_albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist, self.status)
  end

  def songs
    Song.find_by_album(self.id)
  end

end
