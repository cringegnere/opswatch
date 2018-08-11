require 'coveralls'
require 'codacy-coverage'
require 'simplecov'

require 'opswatch'
require 'minitest/autorun'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
GEM_ROOT = File.expand_path('..', __dir__)

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  Codacy::Formatter,
  Coveralls::SimpleCov::Formatter
])
SimpleCov.start
