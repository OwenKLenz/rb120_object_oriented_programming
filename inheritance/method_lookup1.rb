# Using the following code, determine the lookup path used when invoking 
# cat1.color. Only list the classes that were checked by Ruby when searching 
# for the #color method.

class Animal
  # attr_reader :color
  
  @@class = self
  def color
    @color
    @class = @@class
  end
  
  def self.current_class
    self
  end
  
  def initialize(color)
    @class = nil
    @color = color
  end

  def get_path
    if !@class
      puts "path not determined yet."
    else
      path = []
      self.class.ancestors.each do |clss|
        path << clss
        if clss == @class
          p path
          return
        end
      end
    end
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
cat1.get_path
# [Cat, Animal]