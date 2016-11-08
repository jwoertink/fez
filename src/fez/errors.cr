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

    class InvalidTemplateEngineError < Exception
      def initialize(invalid_engine)
        super("Engine #{invalid_engine} is not valid. Options are `slang` or `ecr`")
      end
    end
    
  end
end
