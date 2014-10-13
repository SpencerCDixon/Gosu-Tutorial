require 'gosu'
require 'pry'
require_relative 'lib/snake'

class Game < Gosu::Window

  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    @snake = Snake.new(self, 500, 500)
    # Passes in the window itself for the snake to use,
    # the position will be 500 pixels to the right and 500 pixels downwards (starting from top left)
  end

  def draw
    @snake.draw   
  end

  def update
     # Automatically calling #button_up/button_down 60 frames per second
    @snake.update
  end

  def button_down(id)
    case id
    when Gosu::KbUp
      @snake.move_up = true
    when Gosu::KbDown
      @snake.move_down = true
    when Gosu::KbLeft
      @snake.move_left = true
    when Gosu::KbRight
      @snake.move_right = true
    end
  end

  def button_up(id)
    case id
    when Gosu::KbUp
      @snake.move_up = false
    when Gosu::KbDown
      @snake.move_down = false
    when Gosu::KbLeft
      @snake.move_left = false
    when Gosu::KbRight
      @snake.move_right = false
    end
  end

end
Game.new.show
