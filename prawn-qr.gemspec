# -*- encoding: utf-8 -*-
require File.expand_path('../lib/prawn-qr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josep Jaume"]
  gem.email         = ["josepjaume@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "prawn-qr"
  gem.require_paths = ["lib"]
  gem.version       = Prawn::Qr::VERSION

  gem.add_runtime_dependency 'rqrcode'
  gem.add_runtime_dependency 'prawn'
  gem.add_development_dependency 'qrio'
  gem.add_development_dependency 'mini_magick'
  gem.add_development_dependency 'mocha'
end
