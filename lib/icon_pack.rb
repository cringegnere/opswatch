require 'rmagick'
require 'tempfile'
require_relative 'icon'

module Opswatch
  class IconPack
    def initialize(stack_name, icon_paths = nil)
      icon_paths = icon_paths || %w[hold negative off positive].map { |base_icon| [base_icon, "#{GEM_ROOT}/icons/#{base_icon}.png"] }.to_h
      @stack_name = stack_name
      @file_paths = generate_icons(icon_paths)
    end

    def fetch(key)
      @file_paths[key].path
    end

    private

    def generate_icons(icon_paths)
      icon_paths.map { |name, path| [name, Icon.new(@stack_name, path)] }.to_h
    end
  end
end
