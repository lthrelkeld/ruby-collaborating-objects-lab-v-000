require 'pry'

class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  #loads all the mp3 files in the path directory
  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
