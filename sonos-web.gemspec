# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sonos/web/version'

Gem::Specification.new do |spec|
  spec.name          = "sonos-web"
  spec.version       = Sonos::Web::VERSION
  spec.authors       = ["Gary Rennie"]
  spec.email         = ["webmaster@gazler.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "sinatra"
  spec.add_dependency "sonos"
  spec.add_dependency "sinatra-bootstrap"
end
