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
  
    # Get all the project files to be added, and compile them from ECR templates
    def add_project_files
      {% for name, path in Fez::Template::FILES %}
        path = "{{path.id}}" == "." ? File.join(@directory, "{{name.id}}") : File.join(@directory, "{{path.id}}", "{{name.id}}")
        File.write(path, String.build { |__str__|
          ECR.embed("#{__DIR__}/../templates/{{name.id}}.ecr", "__str__")
        })
      {% end %}
    end

    # Create all of the project folders
    def add_project_folders
      Fez::Template::FOLDERS.each do |dir|
        Dir.mkdir_p(File.join(@directory, dir))
      end
    end
  
    # This generates a src/#{@name}.cr
    def add_initial_app_file
      script = File.read(File.join(__DIR__, "..", "templates", "main_script.cr"))
      File.write(File.join(@directory, "src", "#{@name}.cr"), script)
    end
  end
end
