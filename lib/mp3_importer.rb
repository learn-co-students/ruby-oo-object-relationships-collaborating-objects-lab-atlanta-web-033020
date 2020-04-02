require 'pry'
class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        @files = Dir.children(@path)
    end

    def import
        # binding.pry
        self.files.each {|filename| Song.new_by_filename(filename)}
    end

end

