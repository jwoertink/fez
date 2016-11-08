require "./fez/*"
require "option_parser"
require "ecr/macros"

OptionParser.parse! do |parser|
  parser.banner = "Usage: fez [arguments]"
  
  parser.on("-b NAME", "--build=NAME", "Set the NAME of the app") do |name| 
    Fez::DefaultOptions.application_name = name
  end
  
  parser.on("-d DIR", "--directory=DIR", "Set the DIR where the app will be built") do |dir| 
    Fez::DefaultOptions.application_directory = dir
  end
  
  parser.on("-t ENGINE", "--template=ENGINE", "Change the view template engine. Options are 'slang' or 'ecr'. Default: slang") do |engine|
    if engine.match(/ecr|slang/)
      Fez::DefaultOptions.template_engine = engine
    else
      raise Fez::Errors::InvalidTemplateEngineError.new(engine)
    end
  end

  parser.on("-v", "--version", "Fez version") { puts "Fez v#{Fez::VERSION}"; exit }
  parser.on("-h", "--help", "Show this help") { puts parser; exit }
end

# Start the application
Fez::CLI.run
