# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "ha/version"

Gem::Specification.new do |spec|
  spec.name          = "Ha"
  spec.version       = Ha::VERSION
  spec.authors       = ["Pito Salas"]
  spec.email         = ["pitosalas@gmail.com"]

  spec.summary       = %q{Cli to control Home Automation}
  spec.description   = %q{A well behaved CLI for controlling Philips Hue and other home automation devices.}
  spec.homepage      = "http://www.salas.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = "ha"
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]  
  
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", '~> 0'
  spec.add_development_dependency "minitest"
  spec.add_development_dependency  'ruby-debug-ide', '~> 0'
  
  spec.add_runtime_dependency "thor", '~> 0'
  spec.add_runtime_dependency  "faraday", '~> 0'
end
