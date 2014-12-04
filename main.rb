require 'gosu'
require 'pry'

require_relative 'lib/bounding_box'
require_relative 'lib/rock'
require_relative 'lib/cursor'
require_relative 'lib/keys'

class Game < Gosu::Window
  include Keys

  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    @background = Gosu::Image.new(self, 'img/background.png')
    @large_font = Gosu::Font.new(self, "Futura", SCREEN_HEIGHT / 20)
    @cursor = Cursor.new(self, true)

    @player_choices = [Rock.new(80, 300, self)]
    @mouse_locations = []
  end

  # Mandatory methods in order for gosu to work (draw & update)
  def draw
    @background.draw(0,0,0)
    @cursor.draw
    draw_text(80, 170, "Player Choice", @large_font, 0xffffd700)
    draw_text(650, 170, "Computer Choice", @large_font, 0xffffd700)
    @player_choices.each { |c| c.draw }
  end

  def update
    @player_choices.each { |c| c.update }
    player_picked?
     # Automatically calling #button_up/button_down 60 frames per second
  end

  # Methods I created to help make the game
  def draw_text(x, y, text, font, color)
    font.draw(text, x, y, 3, 1, 1, color)
  end

  def player_picked?
    @player_choices.each do |choice|
      @mouse_locations.each do |location|
        if choice.bounds.collide?(location[0], location[1])
          if choice.state != :selected
            choice.state = :selected
          end
        end
      end
    end
  end

end
Game.new.show
