require "./fez/*"
require "option_parser"
require "ecr/macros"

OptionParser.parse! do |parser|
  parser.banner = "Usage: fez [arguments]"
  parser.on("-b NAME", "--build=NAME", "Set the NAME of the app") { |name| Fez::DefaultOptions.application_name = name }
  parser.on("-d DIR", "--directory=DIR", "Set the DIR where the app will be built") { |dir| Fez::DefaultOptions.application_directory = dir }
  parser.on("-t ENGINE", "--template=ENGINE", "Change the default template engine from Slang") { |engine| Fez::DefaultOptions.template_engine = engine }
  parser.on("-v", "--version", "Fez version") { puts "Fez v#{Fez::VERSION}"; exit }
  parser.on("-h", "--help", "Show this help") { puts parser; exit }
end

# Start the application
Fez::CLI.run
