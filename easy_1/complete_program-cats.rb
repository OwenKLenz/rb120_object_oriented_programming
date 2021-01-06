# Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :name, :age, :fur
  def initialize(name, age, fur)
    super(name, age)
    @fur = fur
  end
  
  def to_s
    "My cat #{name} is #{age} years old and has #{fur} fur."
  end
  
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Update this code so that when you run it, you see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.


# Further Exploration
# An alternative approach to this problem would be to modify the Pet class to 
# accept a colors parameter. If we did this, we wouldn't need to supply an 
# initialize method for Cat.

# Why would we be able to omit the initialize method? Would it be a good idea 
# to modify Pet in this way? Why or why not? How might you deal with some of 
# the problems, if any, that might arise from modifying Pet?


# If there is no initialize method defined in Cat, ruby will search up the chain
# of inheritance for one whenever a new Cat is instantiated. After checking the 
# Cat class it will check the Pet class and use the initialize method defined
# there.

# If you include the colors (called fur, here) parameter in the Pet class, you
# then have to include a color argument for any instantiation of every other 
# class that inherits from Pet unless that class defines its own initialize
# method and also doesn't use super to access Pet's initialize method.

# Technically it would be fine to add @color to Pet, but you would have to make
# sure that every other subclass of Pet that didn't want a @color value defines
# its own initialize method.