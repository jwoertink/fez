module Fez
  class DefaultOptions
    @@directory = "."
    @@template = "kemal_slang"

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
  end
end
