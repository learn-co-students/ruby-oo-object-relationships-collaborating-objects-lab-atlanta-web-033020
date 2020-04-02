class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.children("./spec/fixtures/mp3s")
    end

    def import
        mp3_files = self.files
        mp3_files.each { |file| Song.new_by_filename(file) }
    end
end