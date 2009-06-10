#!/usr/bin/env ruby 

require 'rubygems'
require 'bin/common'
Gem.clear_paths
Gem.path.unshift(File.join(File.dirname(__FILE__), 'gems'))

begin 
  require 'cucumber/rake/task'
   
  Cucumber::Rake::Task.new do |t|
    t.binary = "bin/cucumber"
    t.cucumber_opts = "--require bin/common.rb --format Nagios::NagiosFormatter"
  end
rescue LoadError
end


desc "freeze deps"
task :deps do 

  deps = { 'cucumber' => "~> 0.3.0",
           'rspec'    => ">= 1.1.12",
           'Sipper'   => ">= 1.1.3" }

  puts "\ninstalling dependencies. this will take a few minutes."

  deps.each_pair do |dep, version|
    puts "\ninstalling #{dep} (#{version})"
    system("gem install #{dep} --version '#{version}' -i gems --no-rdoc --no-ri")
  end

end
