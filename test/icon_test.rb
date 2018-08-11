require 'icon'
require "test_helper"

module Opswatch
  class IconTest < MiniTest::Test
    def setup
      @icon = Icon.new('test', 'test/fixtures/test.png')
    end

    def test_responds_with_valid_string
      assert_equal String, @icon.path.class
      assert File.file? @icon.path
    end

    def test_stack_initial
      assert_equal 'T', @icon.send(:stack_initial)
    end
  end
end
