# Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, but the definition 
# may lead to problems in the future. How can this class be fixed to be 
# resistant to future problems?

# By using attr_accessor we create getter and setter methods for 
# :database_handle, but we might not want to be able to change the database 
# (especially since it looks like database handles are supposed to be created
# with some fancy initialize from the Database class). In order to prevent
# someone from changing the database handle, we might want to use attr_reader
# so that we only create a getter method.

# Additionally, we might want to be able to access our flight number so we might
# want to create a getter method for flight number (maybe with attr_reader) so
# that the flight number can be retrieved outside of the class.