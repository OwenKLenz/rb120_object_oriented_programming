# Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message, width=message.length)
    @width = width
    @message = truncate(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  
  attr_reader :message, :width

  def truncate(message)
    message[0...width]
  end
  
  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    "| #{message.center(width)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('', 20)
puts banner

banner = Banner.new("Gotta Catch 'Em All!", 50)
puts banner

banner = Banner.new("Gotta Catch 'Em All!", 10)
puts banner

# Complete this class so that the test cases shown below work as intended. You 
# are free to add any methods or instance variables you need. However, do not 
# make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
# Modify this class so new will optionally let you specify a fixed banner width 
# at the time the Banner object is created. The message in the banner should be 
# centered within the banner of that width. Decide for yourself how you want to 
# handle widths that are either too narrow or too wide.

# Setting the width:
#   set width default to size of message
#   When width is received, set @width to the argument value

# Resizing the message line:
#   When message size is less than width:
#   init empty_space to message size minus width argument
#     left gap is empty_space / 2
#     right gap is empty_space - left gap
    
#   example:
#   message size is 10
#   width is 20
#   empty_space will be 10,
#   left gap will be 5
#   right gap 5


# When message is longer than specified width:
  # ie: Banner.new("0123456789", 5)
  # Truncate the string to width
  # string = string from 0 to width - 1

  
  # +----------------------+
  # |                      |
  # |      1234567890      |
  # |                      |
  # +----------------------+

banner = Banner.new('', 20)
puts banner

banner = Banner.new("Gotta Catch 'Em All!", 50)
puts banner

banner = Banner.new("Gotta Catch 'Em All!", 10)
puts banner