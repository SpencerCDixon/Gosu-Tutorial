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
are certain methods you NEED to use most of the logic is left up to YOU the
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
  * [Text](#text)  
  * [State & Bounding Boxes](#state_bounding)  
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
game. Here is the link to the image: [background
image](https://www.google.com/search?q=epic+backgrounds&hl=en&biw=1280&bih=1288&site=imghp&tbm=isch&source=lnt&tbs=isz:ex,iszw:1000,iszh:1000#facrc=_&imgdii=_&imgrc=cBttlzY0pt6MZM%253A%3BKpBFEfBcp105gM%3Bhttp%253A%252F%252F1.bp.blogspot.com%252F_WQheqI9LV_s%252FTU0Fu8cntzI%252FAAAAAAAAApk%252Foml5ulPnK_I%252Fs1600%252Fgreen_background.png%3Bhttp%253A%252F%252Fmegarockblog.blogspot.com%252F2011%252F02%252Fmaking-dynamic-signaturetutorial.html%3B1000%3B1000)

```ruby
require 'gosu'

class Game < Gosu::Window

  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    @background = Gosu::Image.new(self, 'img/background.png')
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

After getting a background image on the screen lets put some text to display the
players side and then computer side.  We will finish this section off with
putting the actual rock, paper, and scissors on the screen then move on to
explaining how a player would select one.

###<a name="text"></a> Drawing Text Onto Screen

In order to draw text on the screen we first need to instantiate a font just
like we did with the background image.  Gosu has a built in font module in order
to do just that.  This is what it looks like:

```ruby
def initialize
  super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
  @background = Gosu::Image.new(self, 'img/background.png')
  @large_font = Gosu::Font.new(self, "Futura", SCREEN_HEIGHT / 20)
end
# ...rest of Game class
```

When instantiating a new font we pass in 3 parameters: the window, the style of
font, and the size.  In this case I created @large_font that will be in the
Futura typeset and the size will be the screen height divided by 20.

Next I am going to create a helper method to draw text onto the screen.
 I will be able to directly call this helper method in the main #draw method
that the Game class uses.

```ruby
def draw_text(x, y, text, font, color)
  font.draw(text, x, y, 3, 1, 1, color)
end
```
The #draw_text method I created takes 5 parameters: an (x,y) co-ordinate for the top left corner of the
text, the actual text I want displayed, which font to use, and the color of the
text. There are other ways to draw text to the screen but I've found this to
work well and keep my code DRY.

To learn more about drawing Gosu Fonts check out the
[documentation.](http://www.libgosu.org/rdoc/Gosu/Font.html)

Now I am going to use the #draw_text method to separate two sides of the screen.
The left will have the players choice and the right will have the computers
choice.  Once we have this text written I can add the rock, paper, and scissor
elements.

```ruby
class Game < Gosu::Window

  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    @background = Gosu::Image.new(self, 'img/background.png')
    @large_font = Gosu::Font.new(self, "Futura", SCREEN_HEIGHT / 20)
  end

  # Mandatory methods in order for gosu to work (draw & update)
  def draw
    @background.draw(0,0,0)
    draw_text(80, 170, "Player Choice", @large_font, 0xffffd700)
    draw_text(650, 170, "Computer Choice", @large_font, 0xffffd700)
  end

  def update
     # Automatically calling #button_up/button_down 60 frames per second
  end

  # Methods I created to help make the game
  def draw_text(x, y, text, font, color)
    font.draw(text, x, y, 3, 1, 1, color)
  end

end
Game.new.show
```

In order to keep our code DRY I will now create a separate class for each the
Rock, Paper, and Scissors.  Here is an example of what the Rock looks like.  It
instantiates an image, a y and x position, and a state.  There's a lot to this
and I set it up from past experience of what works from me.  In order to really
understand why the first iteration of the Rock class looks like this I need to
explain state and bounding boxes.

```ruby
class Rock

  attr_reader :state
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
```

###<a name="state_bounding"></a> State And Bounding Boxes

#### State
In game development state is an extremely useful tool for setting up events.
Lets say you have a character in a game that can move around when you press
certain keys on the keyboard.  The initial state for the character could be
something like :not_moving (notice how I use a symbol to save memory) and when
the user presses the up arrow key the state changes to :moving_up, etc. 

One example of state I often use is the state of the actual Game class.  For
example, when the user first starts the game the state of the game is most
likely going to be :menu.  Once the user starts the game it might be :running,
and finally when the user loses the state might change to :lost.

Based on all these different states you can have conditional if statements to
determine what is being drawn to the screen and what is being updated.

I will be using states frequently moving forward because I have found they help
me a lot in developing games.  I want to emphasis when working with Gosu just do
what works best for you.  All that matters in the beginning is that you can get
things to function, after that you can go back and refactor the code to make it
more memory efficient/DRY.

#### Bounding
The next concept that I've found integral to making games is collision detection
and bounding boxes.  [To learn more about collision detection check this
out](http://en.wikipedia.org/wiki/Collision_detection). Collision detection is
the process of identifying when two different elements in your program collide
with each other.  It could be the user and an element on the screen, a bullet
and an enemy, a car and a race track, whatever. 

In order to test for these collisions, every element that needs to be tested
will need to have an imaginary box drawn around it.  Then in the #update method
of the Game class we will constantly be checking to see if certain elements have
collided or intersected.  I already have a Bounding Box class that I made which
I'll be using for this project. Here it is:

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
    self.right > box.left && self.bottom < box.top && self.left < box.right &&
self.top > box.bottom
  end
end
```
I'll require the BoundingBox class in my Game class and then any of my elements
that I end up using will have a bounding box surrounding them so I can test for
intersections

Knowing how collision detection works we can go back and look at the Rock class
to explain how it's being implemented.

```ruby
class Rock

  attr_reader :state
  def initialize(x, y, window)
    @rock_image = Gosu::Image.new(window, 'img/rock.png')
    @x = x
    @y = y
    @state = :unselected
  end

  def bounds
    BoundingBox.new(@x, @y, 150, 150)
  end
```
When creating the bounding box for the Rock we pass in the @x and @y
co-ordinates since those can, and probably will, be changing based on user
interaction with the rock. For example, when a user selects the rock we will
probably want to move it to be in the center of the screen.  In order to move it
we will change what it's @x and @y co-ordinates are. The 150, 150 are the dimensions of the actual
image of the rock.  These need to be changed based on the size of the image.



###<a name="keys"></a> Keys & Mouse Interaction

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






 
