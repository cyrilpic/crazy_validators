# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "crazy_validators"
  gem.homepage = "http://github.com/cyrilpic/crazy_validators"
  gem.license = "MIT"
  gem.summary = %Q{ Adds some validation methods for ActiveModel models }
  gem.description = %Q{ CrazyValidators enables easy validation of attributs of an ActiveModel class, such as alphanumericality, presence in a Blacklist. }
  gem.email = "Cyril@picard.ch"
  gem.authors = ["Cyril Picard"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Run Test Unit with code coverage"
task :test_coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task["test"].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "crazy_validators #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
