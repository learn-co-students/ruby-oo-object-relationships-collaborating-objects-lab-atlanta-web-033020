class Artist

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        return_artist = nil
        
        @@all.each {|artist| return_artist = artist if artist.name == name}
        
        return_artist = Artist.new(name) if return_artist == nil
        
        return_artist
    end

    def print_songs
        @songs.each {|song| puts song.name}
    end
end