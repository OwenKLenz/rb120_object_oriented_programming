# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
# What output does this code print? Fix this class so that there are no 
# surprises waiting in store for the unsuspecting developer.

# When @name is initialized, it is set to reference the same string as the name 
# parameter/local variable name passed into Pet.new. This is because String#to_s,
# called on line 7, returns the original string. Now when we call puts fluffy on
# line 19, the to_s defined on line 10 is called and the object referenced by 
# @name(and local variable name) is mutated. As a result, "My name is FLUFFY."
# is output by the call to puts on line 19, the name fluffy has been mutated
# and so puts fluffy.name outputs the mutated string 'FLUFFY' and the puts name
# on line 21 also outputs 'FLUFFY'.


# One way to prevent the surprise mutation of the fluffy local variable is to
# duplicate the object referenced by the name parameter with String#dup on line
# 7 instead of to_s. This way, @name is now referencing a different object from
# local variable name and the mutation on line 11 no longer affects the local
# variable.
# When you do this, @name still gets mutated by the call to String#upcase! on 
# line 12.

# Another way would be to call String#upcase (without a bang) on @name on line 12
# when its interpolated into the string. This would still print out "My name is
#   FLUFFY." without mutating the local or instance variables.


# Further Exploration:

# What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# This code doesn't cause the mutations for a couple of reasons. First, when
# Integer#to_s is called on 42, it returns a new string object, separate from
# the Integer 42. As a result, any mutations performed on @name don't effect
# local variable name which still references an Integer. 
# Additionally, the call to String#upcase! doesn't actually change the string 
# because the characters are numbers, which don't have an uppercase equivalent.