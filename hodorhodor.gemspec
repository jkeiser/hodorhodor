# -*- encoding: utf-8 -*-

$:.unshift(File.dirname(__FILE__) + '/hodor')
require 'hodor/hodor'

Gem::Specification.new do |s|
  s.name = "hodorhodor"
  s.version = Hodor::HODOR

  s.authors = ["John Keiser"]
  s.email = "john@johnkeiser.com"
  s.extra_rdoc_files = [
    "HODORHODOR",
    "HODOR.md"
  ]
  s.files = [ "HODOR", "HODORHODOR", "README.md", "Rakefile" ] + Dir.glob("{hodor,hodorhodor}/**/*")
  s.homepage = "https://github.com/jkeiser/hodorhodor"
  s.require_paths = ["hodor"]
  s.summary = "Hodor hodor hodor hodor hodor"
  s.description = s.summary

  s.bindir       = "hodorhodorhodorhodor"
  s.executables  = %w( hodor hodorhodor )

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rdoc'

end
