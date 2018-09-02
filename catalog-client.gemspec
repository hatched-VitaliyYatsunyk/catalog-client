lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'catalog_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'catalog_client-client'
  spec.version       = CatalogClient::VERSION
  spec.authors       = ['Vitaliy Yatsunyk']
  spec.email         = ['vitaliy.yatsunyk@hatchedlabs.com']

  spec.summary       = %q{Catalog client example}
  spec.description   = %q{Example Client gem}
  spec.homepage      = 'https://hatchedlabs.com'
  spec.license       = 'Hatchedlabs (c)'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'TODO: Set to \'http://mygemserver.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug'

  spec.add_dependency 'activemodel'
  spec.add_dependency 'faraday'
end
