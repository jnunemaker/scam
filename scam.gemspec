# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scam/version"

Gem::Specification.new do |s|
  s.name        = "scam"
  s.version     = Scam::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John Nunemaker"]
  s.email       = ["nunemaker@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Really basic fake model for type-ish stuff}
  s.description = %q{Really basic fake model for type-ish stuff}

  s.add_development_dependency 'rspec', '~> 2.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
