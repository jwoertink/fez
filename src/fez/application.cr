module Fez
  class Application
    ENV = ".env"

    getter name : String
    getter directory : String

    # A valid project name should start with a letter.
    # This will also ensure later if we need to generate a class or module, we can
    def self.valid_name?(project_name)
      !!project_name.match(/\A[a-zA-Z]/)
    end

    def initialize(application_name : String)
      @name = application_name
      @directory = ""
    end

    # The directory will be the location plus the app name.
    # If this folder exists, raise an error so we don't erase it
    def build_directory(directory_name : String)
      @directory = case directory_name
                   when "." then @name
                   else
                     File.join(directory_name)
                   end

      if Dir.exists?(@directory)
        raise Fez::Errors::DirectoryExistsError.new(@directory)
      else
        Dir.mkdir_p(@directory)
      end
    end

    def build_project(template : String)
      template_path = "#{__DIR__}/../templates/#{template}"

      # create all directories under template
      Dir.glob("#{template_path}/**/*/") do |dir|
        new_dir = dir.gsub("#{template_path}/", "")
        puts "Creating directory: #{new_dir}"
        Dir.mkdir_p("#{@directory}/#{new_dir}")
      end

      # copy all files under template
      Dir.glob("#{template_path}/**/*") do |file|
        if File.file? file
          new_file = file.gsub("#{template_path}/", "")
          puts "Copying template: #{new_file}"
          File.write("#{@directory}/#{new_file}", File.read(file).to_s)
        end
      end

      # rename {{name}} files
      Dir.glob("#{@directory}/**/*{{name}}*") do |name_file|
        rename_file = name_file.gsub("{{name}}", @name)
        puts "Renaming template: #{rename_file}"
        File.rename(name_file, rename_file)
      end

      # process _tmpl files
      Dir.glob("#{@directory}/**/*_tmpl") do |tmpl_file|
        template = File.read(tmpl_file)
        template = template.gsub(/{{name}}/, name)
        new_file = tmpl_file.gsub("_tmpl", "")
        puts "Processing template: #{new_file}"
        File.write(new_file, String.build { |io|
          io << template
        })
        File.delete tmpl_file
      end

      create_empty_env
    end

    def create_empty_env
      env = File.join(@directory, ENV)
      File.new(env, "w") unless File.exists?(env)
    end
  end
end
