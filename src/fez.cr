require "./fez/*"
require "option_parser"
require "ecr/macros"

OptionParser.parse! do |parser|
  parser.banner = "Usage: fez [name] [--] [arguments]"
  
  parser.on("-d DIR", "--directory=DIR", "Set the DIR where the app will be built") do |dir| 
    Fez::DefaultOptions.directory = dir
  end
  
  parser.on("-t TEMPLATE", "--template=TEMPLATE", "Select a template. Options
            are kemal_slang, kemal_ecr, kemal_api, kemalyst_ecr") do |template|
    if template.match(/kemal_slang|kemal_ecr|kemal_api|kemalyst_ecr/)
      Fez::DefaultOptions.template = template
    else
      raise Fez::Errors::InvalidTemplateError.new(template)
    end
  end

  parser.on("-v", "--version", "Fez version") { puts "Fez v#{Fez::VERSION}"; exit }
  parser.on("-h", "--help", "Show this help") { puts parser; exit }
end

# Start the application
Fez::CLI.run
