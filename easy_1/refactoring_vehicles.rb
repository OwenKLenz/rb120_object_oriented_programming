# Consider the following classes:

class Vehicle
  attr_reader :make, :model
  
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{make} #{model} with #{self.class::WHEELS} wheels"
  end
end

class Car < Vehicle
  WHEELS = 4
end

class Motorcycle < Vehicle
  WHEELS = 2
end

class Truck < Vehicle
  WHEELS = 6
  
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

# Refactor these classes so they all use a common superclass, and inherit 
# behavior as needed.

puts Car.new("Toyota", "Echo")
puts Truck.new("Chevy", "Avalanche", 10000)
puts Motorcycle.new("Honda", "Ninja")


# Further Exploration
# Would it make sense to define a wheels method in Vehicle even though all of 
# the remaining classes would be overriding it? Why or why not? If you think it 
# does make sense, what method body would you write?

# One reason to do that might be if you wanted to create a default number of 
# wheels (say, 4), then for any class that didn't have 4 wheels, you could
# define an overriding wheels method, otherwise, just let that class inherit
# the Vehicle#wheels method.

# That said, I think it makes sense to just add a WHEELS constant to each class
# since the number of wheels is not likely to change for a particular type of
# vehicle type.