class Rock
  attr_accessor :state
  def initialize(x, y, window)
    @rock_image = Gosu::Image.new(window, 'img/rock.png')
    @x = x
    @y = y
    @state = :unselected
  end

  def bounds
    BoundingBox.new(@x, @y, 150, 150)
  end

  def draw
    @rock_image.draw(@x, @y, 0)
  end

  def update
    if @state == :selected
      @x = 400
      @y = 400
    end
  end
end
