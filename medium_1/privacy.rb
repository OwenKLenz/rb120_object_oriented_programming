# Consider the following class:

class Machine
  attr_writer :switch

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def current_position
    switch
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end

  private :switch=, :flip_switch, :switch
end

# Modify this class so both flip_switch and the setter method switch= are private methods.

Machine.new.flip_switch

# Further Exploration
# Add a private getter for @switch to the Machine class, and add a method to 
# Machine that shows how to use that getter.