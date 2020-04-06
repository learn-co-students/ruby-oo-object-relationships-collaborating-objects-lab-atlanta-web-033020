require 'pry'
require_relative "mp3_importer"
require_relative "song"

class Artist

    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
       Song.all.select {|songs| songs.artist == self}
    end
    
    def add_song(name)
        name.artist = self
    end
    
    def save
        @@all << self
    end

    def Artist.find_or_create_by_name(name)
        artist = @@all.find { |artist| artist.name == name}
        if artist
            artist
        else
            Artist.new(name)
        end
    end

    def print_songs
        Song.all.each do |song|
            if song.artist == self
                puts song.name
            end
        end
    end

end