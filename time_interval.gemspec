# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_interval/version'

Gem::Specification.new do |spec|
  spec.name          = 'time-interval'
  spec.version       = TimeInterval::VERSION
  spec.authors       = ['Sebastian Edwards']
  spec.email         = ['me@sebastianedwards.co.nz']
  spec.summary       = 'Simple library to handle ISO8601 time intervals.'
  spec.description   = ''
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard-rspec'

  spec.add_runtime_dependency 'activesupport'
end
