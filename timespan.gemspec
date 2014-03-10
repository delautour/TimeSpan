# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_span'

Gem::Specification.new do |spec|
  spec.name          = "TimeSpan"
  spec.version       = TimeSpan::VERSION
  spec.authors       = ["Courtney de Lautour"]
  spec.email         = ["clautour@thefrontiergroup.com.au"]
  spec.summary       = %q{A simple time span object}
  spec.homepage      = "https://github.com/Amerdrix/TimeSpan"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", '~> 2.0'
end
