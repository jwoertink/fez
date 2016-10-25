module Fez
  module Errors

    # Thrown when the name of the project is invalid
    class NameError < Exception
      def initialize
        super("You must specify an application name with the -b flag. View the help menu for more info.")
      end
    end

    # Thrown when the project directory already exists
    class DirectoryExistsError < Exception
      def initialize(directory)
        super("Directory #{directory} already exists. Remove before continuing")
      end
    end
    
  end
end
