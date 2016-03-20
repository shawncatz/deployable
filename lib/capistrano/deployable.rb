
path = File.expand_path("../tasks", __FILE__)
Dir["#{path}/*cap"].each do |file|
  load file
end
require "airbrussh/capistrano"
