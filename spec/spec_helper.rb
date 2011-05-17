require File.join(File.dirname(__FILE__), '..', 'lib', 'browsy')

require 'rspec'

include Browsy

# require spec support files and shared behavior
Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each { |f| require f }

