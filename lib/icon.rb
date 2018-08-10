require 'rmagick'
require 'tempfile'

class Icon
  include Magick

  attr_reader :stack_name

  def initialize(stack_name, source_path)
    @stack_name = stack_name
    @source_path = source_path
    @temp_file = Tempfile.new(stack_name)
    draw_initial
  end

  def path
    @temp_file.path
  end

  private

  def stack_initial
    @stack_name[0].upcase
  end

  def draw_initial
    img = ImageList.new(@source_path)
    drawer = Magick::Draw.new
    drawer.annotate(img, 0, 0, 60, 10, stack_initial) do
      self.font = "#{GEM_ROOT}/fonts/arial.ttf"
      self.pointsize = 512
      self.font_weight = Magick::BoldWeight
      self.fill = 'white'
      self.gravity = Magick::SouthEastGravity
      self.stroke = 'black'
      self.stroke_width = 4
    end
    img.write(path)
  end
end
