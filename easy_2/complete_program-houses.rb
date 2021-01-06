# Assume you have the following code:

class House
  include Comparable
  
  attr_reader :price

  def initialize(price)
    @price = price
  end

  
  def <=>(house)
    return 0 if self.price == house.price
    self.price > house.price ? 1 : -1
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)

puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1



# and this output:

# Home 1 is cheaper
# Home 2 is more expensive

# Modify the House class so that the above program will work. You are permitted 
# to define only one new method in House.

# Further Exploration
# Is the technique we employ here to make House objects comparable a good one? 
# (Hint: is there a natural way to compare Houses? Is price the only criteria 
# you might use?) What problems might you run into, if any? Can you think of any 
# sort of classes where including Comparable is a good idea?

# You could compare houses with lots of other metrics like square footage,
# number of bedrooms, energy efficiency, age, etc.
# In the above scenario, nothing is displayed if the houses are the same price.
# You might want to use some other comparison when the houses are the same price
# in order to break the tie (for instance, the aforementioned square footage)
# or else, just output a message stating that the two houses are the same price.

Other classes that you might want to compare could be Student (by grade),
Country (by GDP) or Planet (by mass).

You might run into a problem if the instance variable involved in the
comparison hasn't been initialized yet, for instance a Person class that
compares based on IQ, but one person hasn't taken an IQ test so their @iq 
is currently set to nil.

You might also run into problems if you ended up trying to compare different 
object types (ie: one house price is an int and the other is a string) or 
comparing objects that don't have a comparison operator (<=>) defined.