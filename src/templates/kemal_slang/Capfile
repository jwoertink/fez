# Load DSL and set up stages
require "capistrano/setup"                                              

# Include default deployment tasks
require "capistrano/deploy"
require "capistrano/kemal"

# Load custom tasks from `tasks/deployment/` if you have any defined
Dir.glob("tasks/deployment/*.rake").each { |r| import r  }

