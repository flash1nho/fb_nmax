# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'nmax/version'

Gem::Specification.new do |spec|
  spec.name          = 'nmax'
  spec.version       = Nmax::VERSION
  spec.authors       = ['Igor Okunev']

  spec.summary       = 'nmax'
  spec.description   = ''
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = ['nmax']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4.1'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
