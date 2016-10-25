module Fez
  struct CLI
    property application_name, application_directory

    def self.run
      cli = self.new
      begin
        cli.build_project
      rescue ex : Fez::Errors::NameError
        puts ex.message
        exit(1)
      end
      cli
    end

    def initialize
      @application_name = Fez::DefaultOptions.application_name.as(String)
      @application_directory = Fez::DefaultOptions.application_directory.as(String)
    end

    def build_project
      raise Fez::Errors::NameError.new if @application_name == ""
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
