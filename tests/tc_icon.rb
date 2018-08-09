require_relative '../lib/icon'
require_relative 'test_helper'
require "minitest/autorun"

class TestIcon < MiniTest::Unit::TestCase
  def setup
    @icon = Icon.new('test', 'tests/fixtures/test.png')
  end

  def test_responds_with_valid_string
    assert_equal String, @icon.path.class
    assert File.file? @icon.path
  end

  def test_stack_initial
    assert_equal 'T', @icon.send(:stack_initial)
  end
end
