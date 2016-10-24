module Fez
  module Errors

    # Thrown when the name of the project is invalid
    class NameError < Exception

      def initialize
        super("You must specify an application name with the -b flag. View the help menu for more info.")
      end
    end
    
  end
end
