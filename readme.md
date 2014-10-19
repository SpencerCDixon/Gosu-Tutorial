# Getting Started With Gosu

This is a basic tutorial to help Rubyists interested in Gosu/Game Development to
get started. 

When I was first introduced to Gosu I was extremely intimidated which is why I
wanted to create this tutorial.  After getting an understanding of the basics I
realized how simple Gosu really is.

Gosu is a fantastic way to get a deeper understanding of Object Oriented
Programming.  It's also extremely rewarding being able to create your very own
game from scratch.  

### Prerequisites 

  *  Basic undestanding of Ruby Classes
  *  Basic understanding of Modules


## Table Of Contents
  * [Installation](#install)  
  * Getting Started  
  * Understanding Draw & Update  
  * [Using button keys](#keys)  


###<a name="install"></a> Installation 

The first step is to install the Gosu Gem:
```ruby
gem install gosu
```

For more help getting Gosu Installed you can visit the
[homepage.](http://www.libgosu.org/)
When I initially installed Gosu I had all sorts of errors.  If that happens
don't freak out too much.  Most likely it's because Gosu is a little bit old an
d was made for an older version of ruby (1.8, 1.9).  Even with the errors it
still works fine on my computer when running ruby 2.0.




```ruby
require 'gosu'

class Game < Gosu::Window

  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
  end

end
```


###<a name="keys"></a> Keys 

```ruby
  def draw
   
  end

  def update
     # Automatically calling #button_up/button_down 60 frames per second
  end

  def button_down(id)
    case id
    when Gosu::KbUp
      puts "Up button_down"
    when Gosu::KbDown
      puts "Down button_down"
    when Gosu::KbLeft
      puts "Left button_down"
    when Gosu::KbRight
      puts "Right button_down"
    end
  end

  def button_up(id)
    case id
    when Gosu::KbUp
      puts "Up button_up"
    when Gosu::KbDown
      puts "Down button_up"
    when Gosu::KbLeft
      puts "Left button_up"
    when Gosu::KbRight
      puts "Right button_up"
    end
  end

end
```

Next adding snake to the main class:
```ruby
require 'gosu'
require_relative 'lib/snake'

class Game < Gosu::Window
```
Making snake:
```ruby
class Snake

  attr_accessor :move_up, :move_down, :move_left, :move_right

  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y

   @move_up = false
   @move_down = false
   @move_left = false
   @move_right = false
  end

end
```
In order to use keys in your Gosu game there are two major concepts to understand.  Button down and button up.


```ruby
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
      puts "Up button_up"
    when Gosu::KbDown
      @snake.move_down = false
      puts "Down button_up"
    when Gosu::KbLeft
      @snake.move_left = false
    when Gosu::KbRight
      @snake.move_right = false
    end
  end
```
Next we set the snake to have 4 different moving states. Explanation of what a state is: different modes the object has. Next we need to implement the movement for the snake by giving the snake direction and speed.

```ruby
class Snake

  attr_accessor :move_up, :move_down, :move_left, :move_right

  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y

   @move_up = false
   @move_down = false
   @move_left = false
   @move_right = false

   @image = Gosu::Image.new(@window, 'img/snake.jpg')
  end

  def draw
    @image.draw(@x, @y, 0)
  end

  def update

  end
end
```

Then we setup the main game file to create a new snake and draw it on the screen. The way that we pass in x and y to the snake allows us to adjust where it will appear on the screen when the game starts.

Next we will create methods that adjust its position based on whether not the move_up/down/right/left is switched the true.


```ruby
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
```
Next up we need to create a bounding box so that we can test if the snake collides with its food.  If the collision is detected then we will increment the size of the snake and the score of the player.

A nice feature to implement after getting everything setup would be to make the score go up by more the longer the player is alive.

```ruby
class BoundingBox
  attr_reader :left, :bottom, :width, :height, :right, :top

  def initialize(left, bottom, width, height)
    @left = left
    @bottom = bottom
    @width = width
    @height = height
    @right = @left + @width
    @top = @bottom + @height
  end

  def collide?(x, y)
    x >= left && x <= right && y >= bottom && y <= top
  end

  def intersects?(box)
    self.right > box.left && self.bottom < box.top && self.left < box.right && self.top > box.bottom
```






 
