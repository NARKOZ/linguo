# -*- encoding: utf-8 -*-
require File.expand_path('../lib/linguo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nihad Abbasov", "Laurynas Butkus"]
  gem.email         = ["nihad@42na.in", "laurynas.butkus@gmail.com"]
  gem.description   = %q{Language detection library for Ruby}
  gem.summary       = %q{Linguo detects the language of a given piece of text}
  gem.homepage      = "https://github.com/narkoz/linguo"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "linguo"
  gem.require_paths = ["lib"]
  gem.version       = Linguo::VERSION

  gem.add_runtime_dependency 'json'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
end
