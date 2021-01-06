# Now that we have a Walkable module, we are given a new challenge. Apparently 
# some of our users are nobility, and the regular way of walking simply isn't 
# good enough. Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:

# byron = Noble.new("Byron", "Lord")
# p byron.walk
# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other 
# purposes that we aren't showing here.

# byron.name
# => "Byron"
# byron.title
# => "Lord"

module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Noble
  attr_reader :name, :title
  
  include Walkable
  
  def initialize(name, title)
    @name = name
    @title = title
  end
  
  def walk
    print "#{title} "
    super
  end
  
  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
byron.walk

p byron.name
# => "Byron"
p byron.title
# => "Lord"



# Further Exploration:

module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Animal
  def to_s
    @name
  end
end


class Noble
  attr_reader :name, :title
  
  include Walkable
  
  def initialize(name, title)
    @name = name
    @title = title
  end
  
  def to_s
    "#@title #@name"
  end
  
  def gait
    "struts"
  end
end

class Person < Animal
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Animal
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

byron = Noble.new("Byron", "Lord")
byron.walk

p byron.name
# => "Byron"
p byron.title
# => "Lord"

gracie = Cheetah.new("Gracie")
gracie.walk

sal = Person.new("Sally")
sal.walk
kitty_pie = Cat.new("Fluff Muffin")
kitty_pie.walk