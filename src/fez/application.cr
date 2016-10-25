module Fez
  class Application
    getter name : String
    getter directory : String
    getter engine : String

    def initialize(application_name : String)
      @name = application_name
      @directory = ""
      @engine = Fez::DefaultOptions.template_engine.as(String)
    end
    
    # The directory will be the location plus the app name.
    # If this folder exists, raise an error so we don't erase it
    def build_directory(directory_name : String)
      @directory = case directory_name
      when "." then @name
      else
        File.join(directory_name)
      end

      if Dir.exists?(@directory)
        raise Fez::Errors::DirectoryExistsError.new(@directory) 
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
    
    # Create the views for an inital project
    def add_view_files
      view_loader = Fez::ViewLoader.new
      view_loader.generate(@directory)
    end
  
    # This generates a src/#{@name}.cr
    def add_initial_app_file
      script = <<-CODE
        get "/" do |env|
          view("site/index")
        end
      CODE
      File.write(File.join(@directory, "src", "#{@name}.cr"), script)
    end
  
    # This generates a spec/#{@name}_spec.cr
    def add_initial_spec_file
      script = <<-CODE
        require "./spec_helper"

        describe "root path" do
          start

          it "loads the home page" do
            get "/"
            response.body.should match(/Welcome/i)
          end
        end
      CODE
      File.write(File.join(@directory, "src", "#{@name}_spec.cr"), script)
    end
  end
end
