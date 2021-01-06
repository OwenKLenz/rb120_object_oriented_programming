# Correct the following program so it will work properly. Assume that the 
# Customer and Employee classes have complete implementations; just make the 
# smallest possible change to ensure that objects of both types have access to 
# the print_address method.

module Mailable
  def initialize(name, address, city, state, zip)
    @name = name
    @address = address
    @city = city
    @state = state
    @zip = zip
  end
  
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new("Betty Lewis", "1600 Pennsylvania Ave.", "Washington", "DC", "12345")
bob = Employee.new("Bob Roberts", "123 Easy Street", "New York", "NY", "10000")
betty.print_address
bob.print_address