module Fez
  class Application
    getter name : String
    getter directory : String

    def initialize(application_name : String)
      @name = application_name
      @directory = ""
    end

    def build_directory(directory_name : String)
      @directory = File.join(directory_name, @name)
      puts Dir.exists?(@directory)
    end
  end
end
