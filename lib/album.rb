
class Album
  attr_reader :id, :name
  attr_accessor :name
  @@albums = {}
  @@total_rows = 0
  # @@name = []
  # @@year = []
  # @@artist = []

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@albums.values()
    # @@name
    # @@year
    # @@artist
  end

  def save
  @@albums[self.id] = Album.new(self.name, self.id)
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

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def delete()
    @@albums.delete(self.id)
  end

  # def self.find(name)
  # end
  #
  # def name
  #   @name = name
  # end
  #
  # def year
  #   @year = year
  # end
  #
  # def artist
  #   @artist = artist
  # end


#   def ==(other_album)
#   self.name.eql?(other_album.name) && self.artist.eql?(other_album.artist) && self.year.eql?(other_album.year)
# end
end







# before(:each) do
#   @album = Album.new()
# end






#
# all(): returns all albums;
# find(): finds an album by its name;
# find_by_ranking(): finds an album by its ranking (if we were to add a rank attribute to our class);
# top_rated(): finds the top-rated album.
