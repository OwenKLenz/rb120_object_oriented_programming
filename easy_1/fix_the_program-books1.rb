# Complete this program so that it produces the expected output:

class Book
  attr_reader :author, :title
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration:
# What are the differences between attr_reader, attr_writer, and attr_accessor? 
# Why did we use attr_reader instead of one of the other two? Would it be okay to 
# use one of the others? Why or why not?

# attr_reader creates getter methods for any instance variable names passed to 
# it
# attr_writer creates setter methods for any instance variable names passed to
# it
# attr_accessor creates both getter and setter methods for any instance 
# variable names passed to it.
# attr_reader is used here because we only need the getter methods for this code
# You could use attr_accessor as well and the code would still run, however now
# you have 2 unused setter methods (title=(arg) and author=(arg)) floating 
# around which could best is messy and at worst could cause bugs.
# attr_writer would not work here because we are calling getter methods, not 
# setter methods on lines 17 and 18.

# Instead of attr_reader, suppose you had added the following methods to this 
# class:

def title
  @title
end

def author
  @author
end
# Would this change the behavior of the class in any way? If so, how? If not, 
# why not? Can you think of any advantages of this code?

# These would work just as well as attr_reader :title, :author. Since 
# functionally all the call to attr_reader does is create methods identical to 
# those above.
# The advantage to doing it this way is that you can now add functionality to
# getter methods, whereas with attr_reader created methods, you can't actually
# change them beyond their default implementation.