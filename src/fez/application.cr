module Fez
  class Application
    getter name : String
    getter directory : String

    def initialize(application_name : String)
      @name = application_name
      @directory = ""
    end
    
    # The directory will be the location plus the app name.
    # If this folder exists, raise an error so we don't erase it
    def build_directory(directory_name : String)
      @directory = File.join(directory_name, @name)
      if Dir.exists?(@directory)
        raise "Directory #{@directory} already exists. Remove before continuing"
      else
        Dir.mkdir_p(@directory)
      end
    end

    # The filename will match what's in src/templates.
    # Compile the ecr file, then write the new file in to the project folder
    def add_project_file(filename : String)
      ecr_file = File.join(__DIR__, "..", "templates", "#{filename}.ecr")
      out_file = File.join(@directory, filename)
      io = MemoryIO.new
      # How do you do this?
      # Error executing run: ecr/process "ecr_file" "io"
      # Got: 
      ECR.embed("ecr_file", io)
      File.write(out_file, io.to_s)
    end
  end
end
