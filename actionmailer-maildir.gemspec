# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'bundler/version'
 
Gem::Specification.new do |s|
  s.name        = "actionmailer-maildir"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alexander Flatter"]
  s.email       = ["aflatter@farbenmeer.net"]
  s.homepage    = "http://github.com/aflatter/actionmailer-maildir"
  s.summary     = "A maildir delivery method for ActionMailer"
  s.description = "Uses the maildir gem to store ActionMailer deliveries."
 
  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "actionmailer", ">= 3.0.0"
  s.add_dependency "maildir"

  s.add_development_dependency "rspec"
  s.add_development_dependency "fakefs"
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(WTFPL README.md)
  s.require_path = 'lib'
end
