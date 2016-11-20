module Fez
  class DefaultOptions
    @@directory = "."
    @@template = "slang"
    @@framework = "kemal"

    def self.directory
      @@directory
    end

    def self.directory=(new_dir)
      @@directory = new_dir
    end

    def self.template
      @@template
    end

    def self.template=(template)
      @@template = template
    end

    def self.framework
      @@framework
    end

    def self.framework=(framework)
      @@framework = framework
    end
  end
end
