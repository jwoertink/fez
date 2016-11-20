module Fez
  module Errors

    # Thrown when the name of the project is invalid
    class NameError < Exception
      def initialize
        super("You must specify an application name that begins with a letter using the -b flag. View the help menu for more info.")
      end
    end

    # Thrown when the project directory already exists
    class DirectoryExistsError < Exception
      def initialize(directory)
        super("Directory #{directory} already exists. Remove before continuing")
      end
    end

    class InvalidTemplateError < Exception
      def initialize(invalid_template)
        super("Template #{invalid_template} is not valid. Options are: kemal_slang, kemal_ecr, kemal_api, kemalyst_ecr")
      end
    end
    
  end
end
