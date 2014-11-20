# Getting Started With Gosu

This is a basic tutorial to help Rubyists interested in Gosu/Game Development to
get started.  The game we will be making is Rock, Paper, Scissors.  

When I was first introduced to Gosu it was an intimidating experience which is why I
wanted to create this tutorial.  After getting an understanding of the basics I
realized how simple Gosu really is.  

Gosu is a fantastic way to get a deeper understanding of Object Oriented
Programming.  It's also extremely rewarding being able to create your very own
game from scratch.  

One of my favorite parts of Gosu development is that even though there
are certain methods you NEED to use most of the logic is left up to the
programmer. 

### Prerequisites 

  *  Basic undestanding of Ruby Classes  
  *  Basic understanding of Modules  
  *  Basic understanding of inheritance  

## Table Of Contents
  * [Installation](#install)  
  * [Getting Started](#start)  
  * [Draw & Update](#draw_update)  
  * [Images](#images)  
  * [Using button keys](#keys)  


###<a name="install"></a> Installation 

The first step is to install the Gosu Gem:
```ruby
gem install gosu
```

For more help getting Gosu Installed you can visit the
[homepage.](http://www.libgosu.org/)  

Initially installing Gosu I had all sorts of errors.  If that happens
don't freak.  Most likely it's because Gosu is a little bit old and
was made for an older version of ruby (1.8, 1.9).  Even with the errors it
still works fine on my computer when running ruby 2.0.


###<a name="start"></a> Getting Started With Gosu 

The first step is to make a new directory to store our new Gosu game in.  Then
we will change into the directory and start making some more directories and
files we're going to be using.
```
mkdir rps
cd rps 
```

Now inside of our rps directory we will create a few more subdirectories
in order to stay organized. Then the main game file that we will use to run our
program.

```
mkdir lib
mkdir img
touch main.rb
```

Inside our lib folder we will keep all the classes and modules for our game.
If this is your first time developing a bigger program then it might seem weird
to do this.  You're going to have to trust me that splitting files up will help
keep the game organized and easier to work with especially once it
starts to get bigger.  

Inside our img directory we will keep all images that will be used for the game.  

Finally, open up the main.rb file in the text editor of your choice.  The
main.rb file will be what we use to start the game.  

Go ahead and type this snippet of code into your main.rb and then I will go over
each section. 

```ruby
require 'gosu'

class Game < Gosu::Window

  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
  end

end

Game.new.show
```

The first thing we do is require the gosu library so we can use it to build the
game.  

Next we create the Game class which will hold all of the logic to get the game
running.  Game will inherit from Gosu's Window module.  By doing this it allows
Game to create a new window on your computer screen when you run the game.  This
Gosu::Window module will also initialize all the core components gosu needs to
work.  

One thing I like to do is create two constants for SCREEN_HEIGHT and
SCREEN_WIDTH that we will pass into the initialization that determines our
screen size.  This game will be 1000 pixels by 1000 pixels.  By putting the
height and width in a constant it is easy to change them quickly globally
throughout the game.  You might spend 5-10 hours making your game and decide you
wish the screen was bigger or smaller and this makes it easier.  Also we can use
these constants later on for methods that will make things like displaying text
easier and more accurate.  

When you initialize the Game class you really want to be initializing the
Gosu::Window class which is why we use <code> super </code> and then pass in
some overrides.  The overrides set the width, height, and set full-screen to
false.  There are more advanced settings you can override but for now we will
keep it simple.  

The last snippet of code instantiates a new instance of the Game class we just
created and then calls the #show instance method to display the game screen on your computer.  #Show
is an instance method that gets inherited from Gosu::Window.  If you're not
familiar with the #method_name notation it just means that the methods is an
instance method.  

Another way to write that last line would be:
```ruby
my_game = Game.new
my_game.show
```

Run your main.rb file so you can see the game screen be displayed to the
computer screen. Success!  

###<a name="draw_update"></a> Draw & Update 

Now that we can get a Gosu game set up and a screen drawn we need to go over two
of the most important concepts of Gosu: #draw and #update.  #Draw and #update are
what allow Gosu to display game elements on the screen we just created.

A great way to understand draw and update is to think about those old school
movie cameras that had to be cranked.  They would display a certain number of
frames of film per second.  Each frame would display the cartoon moving ever so
slightly. When put through the projector the movie and
characters would appear to be moving fluidly.  

**Draw** would be the actual film with the pictures of people/cartoons on it.
**Update** would be the projector that sends the film through the camera to be
displayed on the screen. (the person cranking)

The default rate at which Gosu operates is 60 frames per second.  What that
really means is that the Game class's #draw and #update will be called 60 times
every second.  In order for those to be called though we need to have the
methods in the class so lets add those in now.


```ruby
require 'gosu'

class Game < Gosu::Window

  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
  end

  def draw
  end

  def update
  end

end

Game.new.show
```

If you want to see this in action (which I recommend) you can place a puts
statement inside the #update method and watch your terminal while the game is
running.  You should see that puts statement over and over.

```ruby
# rest of Game class
  def update
    puts "Testing fps for update"
  end
```

In order to actually draw something to the screen we are going to need to create an image
object that has the ability of being drawn.  

###<a name="images"></a> Images 

Gosu has a special Image class that can be instantiated with:
```ruby
Gosu::Image.new(args)
```

When creating the image the two arguments you need to pass in are the window
(which is our Game class) and a source for the image.  

Inside my image folder is a background image to use for the background of the
game.

```ruby
require 'gosu'

class Game < Gosu::Window

  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    @background = Gosu::Image.new(self, 'img/background.jpg')
  end

  def draw
    @background.draw(0,0,0)
  end

  def update
  end

end

Game.new.show
```
Once we instantiate the image to the @background instance variable we now need
to draw it to the Window using the #draw method.  The numbers that are being
passed into the draw method are the X, Y, and Z coordinates. It can be very
counter-intuitive but the left corner of the screen is the (0,0) position.  From
the top left corner if you want to go right then increase X and to go down we
increase Y.  Normally going down would make Y be negative which can be a little
tricky at first.




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

In order to use keys in your Gosu game there are two major concepts to understand.  Button down and button up.


Next we set the snake to have 4 different moving states. Explanation of what a state is: different modes the object has. Next we need to implement the movement for the snake by giving the snake direction and speed.
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






 
