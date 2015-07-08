# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ivona_speech_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = "ivona_speech_cloud"
  spec.version       = IvonaSpeechCloud::VERSION
  spec.authors       = ["Sergio Bayona"]
  spec.email         = ["sergio@practicaldesk.com"]
  spec.summary       = %q{Interface for Ivona Speech Cloud.}
  spec.description   = %q{Ability to create speech and list voices.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "aws4", "~> 0.0.2"
  spec.add_dependency "httparty", "~> 0.13.5"
end
