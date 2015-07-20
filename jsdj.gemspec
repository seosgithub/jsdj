# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsdj/version'

Gem::Specification.new do |spec|
  spec.name          = "jsdj"
  spec.version       = Jsdj::VERSION
  spec.authors       = ["seo"]
  spec.email         = ["seotownsend@icloud.com"]
  spec.summary       = "A boring javascript application framework"
  spec.description   = "A unix tool to execute javascript on a headless browser"
  spec.homepage      = "https://github.com/sotownsend/jsdj"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "pry", "~> 0.1"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency 'webrick', '~> 1.3'
  spec.add_runtime_dependency "therubyracer", "~> 0.12"
end
