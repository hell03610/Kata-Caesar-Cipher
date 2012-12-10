require 'rubygems'
require 'rspec/core/rake_task'

namespace :test do

	desc "Run tests"
	RSpec::Core::RakeTask.new(:all) do |t|
	    t.pattern = "test/*.rb"
	    t.rspec_opts = " -c"
	end

	desc "Run verbose tests"
	RSpec::Core::RakeTask.new(:verbose) do |t|
	    t.pattern = "test/*.rb"
	    t.rspec_opts = " -c --format d"
	end


end