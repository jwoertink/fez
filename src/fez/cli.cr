module Fez
  struct CLI
    def self.run(options = ARGV)
      begin
        raise Fez::Errors::NameError.new unless options.first?
        cli = self.new(options.first)
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
    end

    def build_project
      begin
        unless Fez::Application.valid_name?(@name)
          raise Fez::Errors::NameError.new
        end
      rescue ex
        puts ex.message
        exit(1)
      end
      puts "Building #{@name}"

      new_app = Fez::Application.new(@name)
      new_app.build_directory(@directory)
      new_app.build_project(@template)
      new_app
    end
  end
end
