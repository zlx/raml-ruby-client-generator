# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'raml_ruby_client/generator/version'

Gem::Specification.new do |spec|
  spec.name          = "raml-ruby-client-generator"
  spec.version       = RamlRubyClient::Generator::VERSION
  spec.authors       = ["Newell Zhu"]
  spec.email         = ["zlx.star@gmail.com"]

  spec.summary       = %q{Auto generate Ruby Client from Raml.}
  spec.description   = %q{Auto generate Ruby Client from Raml.}
  spec.homepage      = "https://github.com/zlx/raml-ruby-client-generator"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   += ['gen-raml-ruby']
  spec.require_paths = ["lib"]

  spec.add_dependency "raml_ruby"
  spec.add_dependency "activesupport"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug"
end
