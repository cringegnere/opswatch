Gem::Specification.new do |s|
  s.name = 'opswatch'
  s.version = '0.0.1'
  s.author = 'Rizzo Gianluca'
  s.email = 'giangio.io2@gmail.com'
  s.date = '2018-08-01'
  s.summary = 'Simple tray application that notifies the status of your
               Opswork stacks'
  s.files = Dir['lib/*.rb'] + Dir['bin/*'] + Dir['icons/*']
  s.require_paths = ['lib']
  s.bindir = 'bin'
  s.executable = 'opswatch'

  # Dependencies

  s.add_runtime_dependency('aws-sdk')
  s.add_runtime_dependency('rmagick')
  s.add_runtime_dependency('ruby-libappindicator')
  s.add_runtime_dependency('app_configuration')
end
