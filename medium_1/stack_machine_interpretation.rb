# Write a class that implements a miniature stack-and-register-based programming
# language that has the following commands:

# n - Place a value n in the "register". Do not modify the stack.
# PUSH - Push the register value on to the stack. Leave the value in the register.
# ADD - Pops a value from the stack and adds it to the register value, storing the
# result in the register.
# SUB - Pops a value from the stack and subtracts it from the register value, 
# storing the result in the register.
# MULT - Pops a value from the stack and multiplies it by the register value, 
# storing the result in the register.
# DIV - Pops a value from the stack and divides it into the register value, 
# storing the integer result in the register.
# MOD - Pops a value from the stack and divides it into the register value, 
# storing the integer remainder of the division in the register.
# POP - Remove the topmost item from the stack and place in register
# PRINT - Print the register value
# All - operations are integer operations (which is only important with DIV and 
# MOD).

# Programs will be supplied to your language method via a string passed in as an
# argument. Your program should produce an error if an unexpected item is 
# present in the string, or if a required stack value is not on the stack when 
# it should be (the stack is empty). In all error cases, no further processing 
# should be performed on the program.

# You should initialize the register to 0.

class MiniLangError < StandardError; end
class EmptyStackError < MiniLangError; end
class InvalidTokenError < MiniLangError; end

class Minilang
  def initialize(program)
    @program = program
    @register = 0
    @stack = []
  end

  def eval(value)
    program = format(@program, value)

    program.split.each do |token|
      if valid_integer?(token)
        @register = token.to_i
      else
        begin
          begin
            send(token.downcase.to_sym)
          rescue NoMethodError
            raise InvalidTokenError, "Invalid Token: #{token}"
          end
        rescue MiniLangError => error
          puts error.message
          return
        end
      end
    end
  end

  def valid_integer?(token)
    command.to_i.to_s == command
  end

  def push
    @stack << @register
  end

  def pop
    raise EmptyStackError, "Empty Stack!" if @stack.empty?

    @register = @stack.pop
  end

  def print
    puts @register
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end
end

# Examples:
RECTANGLE_AREA = "%<width>d PUSH %<height>d MULT PRINT"
C_TO_F = "5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT"
F_TO_C = "9 PUSH 5 PUSH 32 PUSH %<degrees_f>d SUB MULT DIV PRINT"
MPH_TO_KPH = "3 PUSH %<mph>d PUSH 5 MULT DIV PRINT"

cel_to_fahr_converter = Minilang.new(C_TO_F)
fahr_to_cel_converter = Minilang.new(F_TO_C)
rectangle_area_calc = Minilang.new(RECTANGLE_AREA)
mph_to_kph_calc = Minilang.new(MPH_TO_KPH)

mph_to_kph_calc.eval(mph: 10)

rectangle_area_calc.eval(width: 10, height: 5)

cel_to_fahr_converter.eval(degrees_c: 100)
cel_to_fahr_converter.eval(degrees_c: 0)
cel_to_fahr_converter.eval(degrees_c: -40)

fahr_to_cel_converter.eval(degrees_f: 212)
fahr_to_cel_converter.eval(degrees_f: 32)
fahr_to_cel_converter.eval(degrees_f: -40)


# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)