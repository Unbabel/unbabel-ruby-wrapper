# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unbabel/version'

Gem::Specification.new do |spec|
  spec.name          = "unbabel"
  spec.version       = Unbabel::VERSION
  spec.authors       = ["David Silva"]
  spec.email         = ["davidslv@gmail.com"]
  spec.summary       = %q{A wrapper for Unbabel API.}
  spec.description   = %q{Unbabel is a translation as a service, this is a ruby wrapper around their API.}
  spec.homepage      = "https://github.com/Davidslv/unbabel-ruby-wrapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.required_ruby_version = '>= 2.0.0'
  spec.add_development_dependency "rspec", '~> 3.1', '>= 3.1.0'

  spec.add_runtime_dependency 'unirest', '~> 1.1', '>= 1.1.2'
end
