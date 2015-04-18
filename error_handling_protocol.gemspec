# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'error_handling_protocol/version'

Gem::Specification.new do |spec|
  spec.name          = 'error_handling_protocol'
  spec.version       = ErrorHandlingProtocol::VERSION
  spec.authors       = ['Nicolas Papagna Maldonado']
  spec.email         = ['nicolas.papagna@10Pines.com']
  spec.summary       = %q{Provides common error messages in the protocol of class Object. For example, to report the error that a subclass should have implemented one of the superclass's messages.}
  spec.homepage      = 'https://github.com/10Pines/error_handling_protocol'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
