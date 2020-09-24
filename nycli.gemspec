require_relative 'lib/NYCLI/version'

Gem::Specification.new do |spec|
  spec.name          = "NYCLI"
  spec.version       = NYCLI::VERSION
  spec.authors       = ["Roeck"]
  spec.email         = ["rons9n@gmail.com"]

  spec.summary       = "CLI Data Scraping Gem"
  spec.description   = "For scraping the latest NYC events"
  spec.homepage      = "https://rubygems.org"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
