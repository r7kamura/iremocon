# -*- encoding: utf-8 -*-
require File.expand_path('../lib/iremocon/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryo NAKAMURA"]
  gem.email         = ["ryo-nakamura@cookpad.com"]
  gem.description   = "Iremocon is a gem for managing iRemocon through telnet"
  gem.summary       = "iRemocon manager"
  gem.homepage      = "https://github.com/r7kamura/iremocon"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "iremocon"
  gem.require_paths = ["lib"]
  gem.version       = Iremocon::VERSION

  gem.add_development_dependency "rspec"
end
