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
      if Dir.exists?(@directory)
        raise "Directory #{@directory} already exists. Remove before continuing"
      else
        Dir.mkdir_p(@directory)
      end
    end

    def add_project_file(filename : String)
      ecr_file = "#{__DIR__}/../templates/#{filename}.ecr"
      puts "ECR: #{ecr_file}"
      puts "OUT: #{File.join(@directory, filename)}"
      #File.write(File.join(@directory, filename), String.build { |str|
      #  ECR.embed("ecr_file", "str")
      #})
    end
  end
end
