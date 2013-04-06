# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shelltastic/version'

Gem::Specification.new do |gem|
  gem.name          = "shelltastic"
  gem.version       = ShellTastic::VERSION
  gem.authors       = ["Bradley Smith"]
  gem.email         = ["bradleydsmith@gmail.com"]
  gem.description   = %q{Shelltastic is a simple *nix shell wrapper}
  gem.summary       = %q{Shelltastic is a simple *nix shell wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('open4', '>= 1.3.0')
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
