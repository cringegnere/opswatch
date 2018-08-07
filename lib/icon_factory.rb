require 'rmagick'
require 'tempfile'


class IconFactory
  include Magick

  BASE_ICONS = %w(hold negative off positive).freeze

  def self.generate_icons(name)
    text = name[0].upcase
    BASE_ICONS.map do |base_icon|
      destination_file = Tempfile.new(base_icon)
      img = ImageList.new("#{GEM_ROOT}/icons/#{base_icon}.png")
      drawer = Magick::Draw.new
      drawer.annotate(img, 0, 0, 60, 10, text) do
        self.font = 'Arial'
        self.pointsize = 512
        self.font_weight = Magick::BoldWeight
        self.fill = 'white'
        self.gravity = Magick::SouthEastGravity
        self.stroke = "black"
        self.stroke_width = 4
      end
      img.write(destination_file.path)
      [base_icon, destination_file]
    end.to_h
  end
end
