# Below we have 3 classes: Student, Graduate, and Undergraduate. Some details 
# for these classes are missing. Make changes to the classes below so that the 
#   following requirements are fulfilled:

# Graduate students have the option to use on-campus parking, while 
# Undergraduate students do not.

# Graduate and Undergraduate students have a name and year associated with them.

# Note, you can do this by adding or altering no more than 5 lines of code.

class SentientBeing
  def initialize
    @currently_alive = true
    puts "#{@name} was created in #{@year} with "\
    "#{!!@parking ? "parking" : "no parking"} privileges"
  end
end

class Student < SentientBeing
  def initialize(name, year)
    @name = name
    @year = year
    super()
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    @parking = parking
    super(name, year)
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

Undergraduate.new("Joe", 1986)
Graduate.new("Jeff", 2086, true)