# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'happy_cube/version'

Gem::Specification.new do |spec|
  spec.name          = "happy_cube"
  spec.version       = HappyCube::VERSION
  spec.authors       = ["Cristi Lupascu"]
  spec.email         = ["cristi.lupascu@gmail.com"]
  spec.summary       = %q{Solver for HappyCube puzzles}
  spec.description   = %q{Solver for HappyCube puzzles (http://www.happycube.com/)}
  spec.homepage      = "https://github.com/clupascu/happy-cube"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "libnotify", "~> 0.9"
  spec.add_development_dependency "guard", "~> 2.0"
  spec.add_development_dependency "guard-minitest", "~> 2.0"
end
