module Fez
  class DefaultOptions
    @@application_name = ""
    @@application_directory = "."
    @@template_engine = "slang"

    def self.application_name
      @@application_name
    end

    def self.application_name=(new_name)
      @@application_name = new_name
    end

    def self.application_directory
      @@application_directory
    end

    def self.application_directory=(new_dir)
      @@application_directory = new_dir
    end

    def self.template_engine
      @@template_engine
    end

    def self.template_engine=(new_engine)
      @@template_engine = new_engine
    end

  end
end
