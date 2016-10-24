require "spec"
require "file_utils"
require "ecr/macros"

# Doing this because the main fez file works more like an executable.
# Each spec should call it's own file individually.
macro spec_source(*filenames)
  {% for filename in filenames %}
  require "../src/fez/#{ {{filename}} }"
  {% end %}
end
