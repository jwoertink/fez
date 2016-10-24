module Fez
  struct CLI
    DEFAULT_NAME = ""
    DEFAULT_DIR = "."
    property application_name, application_directory

    def self.run(opts : Hash(Symbol, String))
      cli = self.new(opts.fetch(:app_name, DEFAULT_NAME), opts.fetch(:app_dir, DEFAULT_DIR))
      begin
        cli.build_project
      rescue ex : Fez::Errors::NameError
        puts ex.message
        exit(1)
      end
      cli
    end

    def initialize(app_name = DEFAULT_NAME, app_dir = DEFAULT_DIR)
      @application_name = app_name
      @application_directory = app_dir
    end

    def build_project
      raise Fez::Errors::NameError.new if @application_name == DEFAULT_NAME
      puts "Building #{@application_name}"

      new_app = Fez::Application.new(@application_name)
      new_app.build_directory(@application_directory)
      new_app.add_project_folders
      new_app.add_project_files
      new_app.add_initial_app_file
      new_app
    end
  end
end
