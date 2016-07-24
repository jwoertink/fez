require "spec"
require "file_utils"

# Doing this because the main fez file works more like an executable.
# Each spec should call it's own file individually.
# TODO: this throws a weird error :/
#macro spec_source(filename)
#  require "./src/fez/#{ {{filename}} }"
#end
