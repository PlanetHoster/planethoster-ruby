lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "planethoster_api/version"

Gem::Specification.new do |spec|
  spec.name          = "planethoster_api"
  spec.version       = PlanethosterApi::VERSION
  spec.authors       = ["marcandreg"]
  spec.email         = ["marc-andre.godin@planethoster.info"]

  spec.summary       = "PlanetHoster API wrapper"
  spec.description   = "Provide ruby gem for the PlanetHoster api's"
  spec.homepage      = "https://github.com/PlanetHoster/planethoster-ruby"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/PlanetHoster/planethoster-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/PlanetHoster/planethoster-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
