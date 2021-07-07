
class Song

    attr_accessor :name
    attr_reader :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self) if !artist.songs.include?(self)
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        split_filename = filename.split(" - ")

        # binding.pry

        new_song = Song.new(split_filename[1])
        new_song.artist_name = (split_filename[0])
        @@all << new_song
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end