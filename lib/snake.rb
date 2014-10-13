class Snake

  attr_accessor :move_up, :move_down, :move_left, :move_right, :x, :y

  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y

   @move_up = false
   @move_down = false
   @move_left = false
   @move_right = false
   @speed = 5 

   @image = Gosu::Image.new(@window, 'img/snake.jpg')
  end

  def draw
    @image.draw(@x, @y, 0)
  end

  def update
    if move_up == true
     @y += -@speed
    end
    if move_down == true
     @y += @speed
    end
    if move_left == true
     @x += -@speed
    end
    if move_right == true
     @x += @speed
    end
  end

end
