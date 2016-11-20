module Fez
  struct CLI
    def self.run(options = ARGV)
      cli = self.new(options.first? || "my_project")
      begin
        cli.build_project
      rescue ex : Fez::Errors::NameError | Fez::Errors::DirectoryExistsError
        puts ex.message
        exit(1)
      end
      cli
    end

    def initialize(@name : String)
      @directory = Fez::DefaultOptions.directory.as(String)
      @template = Fez::DefaultOptions.template.as(String)
      @framework = Fez::DefaultOptions.framework.as(String)
    end

    def build_project
      raise Fez::Errors::NameError.new unless Fez::Application.valid_name?(@name)
      puts "Building #{@name}"

      new_app = Fez::Application.new(@name)
      new_app.build_directory(@directory)
      new_app.build_project(@framework, @template)
      new_app
    end
  end
end
