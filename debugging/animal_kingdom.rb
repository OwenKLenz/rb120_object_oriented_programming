# The code below raises an exception. Examine the error message and alter the 
# code so that it runs without error.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# When we instantiate our Songbird object, we're passing 3 arguments to initialize
# We initialize @song to the song argument in Songbird#initialize but then we 
# call super on line 40, we're passing all 3 arguments given to initialize to the
# superclass version of initialize. Since this is Animal#initialize, which only
# expects 2 arguments, an ArgumentError exception is raised. In order to avoid
# we can explicitly pass only the 2 arguments needed in Animal#initialize to super
# on line 40 like this:

# super(diet, superpower)