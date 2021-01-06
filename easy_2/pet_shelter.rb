# Consider the following code:
class Pet
  attr_reader :name, :animal

  def initialize(animal, name)
    @animal = animal
    @name = name
  end
  
  def to_s
    "#{'aeiou'.include?(animal.chars.first) ? 'an' : 'a'} #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets
  def initialize(name, *pets)
    @name = name
    @pets = pets
  end

  def number_of_pets
    @pets.size
  end
  
  private
  
  def print_pets
    pets.each_with_object('') do |pet, memo|
      memo << pet.to_s << "\n"
    end
  end
end

class Human < Owner
  def <<(pet)
    @pets << pet
  end
  
  def to_s
    "#{self.name} owns #{self.number_of_pets} pets:\n#{print_pets}\n"
  end
end

class Shelter < Owner
  attr_reader :adoptions

  def initialize(name, *pets)
    super
    @adoptions = {}
  end

  def adopt(human, pet)
    if !pets.include?(pet)
      puts "That pet doesn't seem to be here.\n\n"
      return
    end
    human << pet
    @adoptions[human.name] ||= human
    self.pets.delete(pet)
  end

  def print_adoptions
    @adoptions.each do |owner_name, owner|
      puts "#{owner_name} has adopted the following pets:"
      puts owner.pets
      puts
    end
  end

  def to_s
    "The Animal Shelter has #{self.number_of_pets} pets:\n#{print_pets}\n"
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
zeke         = Pet.new('tiger', 'Ezekiel')
grace        = Pet.new("cat", "Gracie")
dumbo        = Pet.new("elephant", "Dumbo")

phanson = Human.new('P Hanson', Pet.new("angler fish", "Fluffy"), 
                    Pet.new("rock", "Gwendolyn"))
bholmes = Human.new('B Holmes')

shelter = Shelter.new("Animal Shelter", butterscotch, pudding, darwin, kennedy, 
                      sweetie, molly, chester, zeke, grace, dumbo)
puts shelter
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

snoopy = Pet.new("dog", "Snoopy Dogg")

shelter.adopt(bholmes, snoopy) # => "That pet doesn't seem to be here."

shelter.print_adoptions

puts phanson
puts bholmes

puts shelter

# Write the classes and methods that will be necessary to make this code run, 
# and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The order of the output does not matter, so long as all of the information is 
# presented.