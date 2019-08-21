lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "top_box_office/version"

Gem::Specification.new do |spec|
  spec.name          = "top_box_office"
  spec.version       = TopBoxOffice::VERSION
  spec.authors       = ["Shawn Tennity"]
  spec.email         = ["shawntennity@gmail.com"]

  spec.summary       = %q{This gem provides the top box office movies with their perfomance numbers.}
  spec.description   = %q{Longer description coming soon.}
  spec.homepage      = "https://github.com/stennity8/top_box_office"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/stennity8/top_box_office"
  spec.metadata["changelog_uri"] = "https://CHANGELOG.md.comingsoon"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri", ">=1.10.4"
  spec.add_development_dependency 'colorize', '~> 0.8.1'
end
