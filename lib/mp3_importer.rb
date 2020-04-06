require 'pry'

class MP3Importer

    attr_accessor :path
    
    def initialize(path)
        @path = path
        # binding.pry
    end
    
    def files
        # I think I will need to create an array of file names here of the files whose data I want to import
        @files = []
        Dir.entries(path).select do |file|
            if !File.directory?(file) && file.end_with?(".mp3")
                @files << file
            end
        end
    end

    def import
        # I think I will have to iterate over the files names to operate on each here calling import on Song.new_by_filename(some_filename)
        files.each do |file|
            Song.new_by_filename(file)
        end
    end
end
