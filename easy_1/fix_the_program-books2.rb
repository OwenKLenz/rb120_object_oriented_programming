# Complete this program so that it produces the expected output:

class Book
  attr_accessor :title, :author
  
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What do you think of this way of creating and initializing Book objects? (The 
# two steps are separate.) Would it be better to create and initialize at the 
# same time like in the previous exercise? What potential problems, if any, are 
# introduced by separating the steps?

# When you create the getter and setter methods before initializing the instance
# variables, the instance variables still exist even when you haven't yet 
# called the setter method, but they are set to reference nil. Because of this
# you might run into problems if you attempted to invoke the getter method 
# somewhere elseor if you tried to make use of the instance variable set to nil
# when you were expecting it to be a string.

# I'm not sure it outweighs the obvious downside, but one benefit to doing them
# separately is that you can more easily initialize new Book objects since you
# don't have to pass several argument to new.