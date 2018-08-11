$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
GEM_ROOT = File.expand_path("../..", __FILE__)

require "opswatch"
require "minitest/autorun"
require 'simplecov'
require 'coveralls'

Coveralls.wear!
SimpleCov.start
