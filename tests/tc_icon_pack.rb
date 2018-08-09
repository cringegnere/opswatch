require_relative '../lib/icon_pack'
require_relative 'test_helper'
require "minitest/autorun"

class TestIconPack < MiniTest::Unit::TestCase
  def setup
    @icon_pack = IconPack.new('test')
  end

  def test_responds_with_valid_string
    assert_equal String, @icon_pack.fetch('hold').class
    assert File.file? @icon_pack.fetch('hold')
  end

  def test_generate_icons
    icons = @icon_pack.send(:generate_icons, Array.new(4) { |n| ['test' + n.to_s, 'tests/fixtures/test.png'] }.to_h )
    assert_equal 4, icons.count
    assert icons.all?{ |i, v| File.file? v.path }
  end
end
