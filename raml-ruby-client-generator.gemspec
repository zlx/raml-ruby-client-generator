# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'raml/ruby/client/generator/version'

Gem::Specification.new do |spec|
  spec.name          = "raml-ruby-client-generator"
  spec.version       = Raml::Ruby::Client::Generator::VERSION
  spec.authors       = ["Newell Zhu"]
  spec.email         = ["zlx.star@gmail.com"]

  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/zlx/raml-ruby-client-generator"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   += ['gen-raml-ruby']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
