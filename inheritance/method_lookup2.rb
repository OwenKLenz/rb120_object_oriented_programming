# Using the following code, determine the lookup path used when invoking 
# cat1.color. Only list the classes and modules that Ruby will check when 
# searching for the #color method.

class Animal
  def things
    
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# The lookup path for the color method will be all of Cat's ancestors. Because 
# there is no #color method, ruby will search through the classes [Cat, Animal, 
# Object, Kernel, BasicObject] and return a NoMethodError when it doesn't find
# the #color method.