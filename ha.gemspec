
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ha/version"

Gem::Specification.new do |spec|
  spec.name          = "HA"
  spec.version       = Ha::VERSION
  spec.authors       = ["Pito Salas"]
  spec.email         = ["pitosalas@gmail.com"]

  spec.summary       = %q{Cli to control Home Automation}
  spec.description   = %q{A well behaved CLI for controlling Philips Hue and other home automation devices.}
  spec.homepage      = "http://www.salas.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency  'ruby-debug-ide'
  
  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency  "faraday"
  spec.add_runtime_dependency  "terminal-table"

  
end