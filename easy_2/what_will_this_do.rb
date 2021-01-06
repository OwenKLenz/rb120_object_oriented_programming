# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

# Line 18 calls the class method Something::dupdata which will pass the string
# "ByeBye" to puts which outputs the string
# On line 19, our Something object created on line 17 calls the 
# Something#dupdata instance variable which will return 'Hello' concatenated to
# 'Hello which puts will then output as "HelloHello'