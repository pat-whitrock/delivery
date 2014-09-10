# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delivery/version'

Gem::Specification.new do |spec|
  spec.name          = 'delivery'
  spec.version       = Delivery::VERSION
  spec.authors       = ['Pat Whitrock']
  spec.email         = ['patrick.whitrock@gmail.com']
  spec.summary       = %q{Ruby wrapper for the delivery.com API}
  spec.description   = %q{Ruby wrapper for the delivery.com API}
  spec.homepage      = 'https://github.com/pat-whitrock/delivery'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
