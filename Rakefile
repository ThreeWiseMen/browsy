require 'bundler'
Bundler::GemHelper.install_tasks

FileList['tasks/**/*.rake'].each { |task| import task }

task :default => :spec

