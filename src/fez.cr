require "./fez/*"
require "option_parser"
require "ecr/macros"

options = {} of Symbol => String

OptionParser.parse! do |parser|
  parser.banner = "Usage: fez [arguments]"
  parser.on("-b NAME", "--build=NAME", "Set the NAME of the app") { |name| options[:app_name] = name }
  parser.on("-d DIR", "--directory=DIR", "Set the DIR where the app will be built") { |dir| options[:app_dir] = dir }
  parser.on("-v", "--version", "Fez version") { puts "Fez v#{Fez::VERSION}"; exit }
  parser.on("-h", "--help", "Show this help") { puts parser; exit }
end

# Start the application
Fez::CLI.run(options)
