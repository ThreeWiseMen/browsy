begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  desc 'RSpec rake task not available'
  task :spec do
    abort 'RSpec rake task is not available. Install with: gem install rspec'
  end
end

