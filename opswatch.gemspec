lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "opswatch/version"

Gem::Specification.new do |spec|
  spec.name          = "opswatch"
  spec.version       = Opswatch::VERSION
  spec.authors       = ["Gianluca Rizzo"]
  spec.email         = ["ing.rizzo.gianluca@gmail.com"]

  spec.summary       = 'Simple tray application that notifies the status of your Opswork stacks.'
  spec.description   = 'Simple tool that helps an AWS OpsWorks user to be constantly informed about the status of multiple stacks.
                        Uses the appindicator library to show status icon on the OS traybar.'
  spec.homepage      = 'https://github.com/gianlucarizzo/opswatch'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executable    = 'opswatch'
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "ci_reporter_minitest", "~> 1.0.0"

  spec.add_runtime_dependency('aws-sdk', "~> 3.0.1")
  spec.add_runtime_dependency('rmagick', "~> 2.16.0")
  spec.add_runtime_dependency('ruby-libappindicator', "~> 0.1.5")
  spec.add_runtime_dependency('app_configuration', "~> 0.0.3")
end
