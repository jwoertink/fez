require "./fez/*"
require "option_parser"

application_name = "my_temp_app"

OptionParser.parse! do |parser|
  parser.banner = "Usage: fez [arguments]"
  parser.on("-b NAME", "--build=NAME", "Set the NAME of the app") { |name| application_name = name }
  parser.on("-v", "--version", "Fez version") { puts "Fez v#{Fez::VERSION}" }
  parser.on("-h", "--help", "Show this help") { puts parser }
end

puts "building #{application_name}"
