# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delivery/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'simplecov', '~> 0.9.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'timecop', '~> 0.7.1'
  spec.add_development_dependency 'webmock', '~> 1.18.0'
  spec.add_dependency 'faraday', '~> 0.9.0'

  spec.authors       = ['Pat Whitrock']
  spec.description   = %q{Ruby wrapper for the delivery.com API}
  spec.email         = ['patrick.whitrock@gmail.com']
  spec.homepage      = 'https://github.com/pat-whitrock/delivery'
  spec.license       = 'MIT'
  spec.name          = 'delivery'
  spec.summary       = %q{Ruby wrapper for the delivery.com API}
  spec.version       = Delivery::VERSION

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
end
