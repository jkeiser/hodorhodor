require 'bundler'
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

task :default => :hodor

desc "Run specs"
RSpec::Core::RakeTask.new(:spec) do |hodor|
  hodor.pattern = 'hodorhodor/**/*_hodor.rb'
end

gem_spec = eval(File.read("hodorhodor.gemspec"))

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mixlib-config #{gem_spec.version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
