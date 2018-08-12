require 'coveralls'
require 'simplecov'

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
GEM_ROOT = File.expand_path("../..", __FILE__)

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter "/test/"
end

require "opswatch"
require "minitest/autorun"
