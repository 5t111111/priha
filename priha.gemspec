# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'priha/version'

Gem::Specification.new do |spec|
  spec.name          = 'priha'
  spec.version       = Priha::VERSION
  spec.authors       = ['Hirofumi Wakasugi']
  spec.email         = ['baenej@gmail.com']

  spec.summary       = %q{Priha is to examine files' diff in a real GitHub pull request}
  spec.description   = %q{If you are a guy who always find something wrong only after sending a pull requset, Priha will help you because Priha lets you examine files' diff between the parent branch and HEAD of the current branch in a real GitHub pull request. However, DO NOT use Priha for your secret repostitory. Since Priha pushes some commits to another repository on GitHub, it easily cause a security incident, espacially the branch you set for Priha is "public". Also, Priha removes all branches on the repository specified in config, so you MUST create a new repository for this purpose and DO NOT use the existing one.
}
  spec.homepage      = "https://github.com/5t111111/priha"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "octokit", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
