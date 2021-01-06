# Consider the following broken code:

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end
  
  protected
  
  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

# Modify this code so it works. Do not make the amount in the wallet accessible 
# to any method that isn't part of the Wallet class.

# Further Exploration
# This example is rather contrived and unrealistic, but this type of situation
# occurs frequently in applications. Can you think of any applications where
# protected methods would be desirable?

# Let say you were checking in at the hospital. When you sign in, you give them
# your information. A nurse takes down your information on a computer: name, 
# birth date, ss#, etc. Within the computer, a new Patient object is created 
# with all your information. Now in order to verify that your information is 
# correct, they compare this new Patient object to their internal record of the 
# Patient object with your name. In order to compare the ss#, the two Patient 
# objects should be able to call the ss# getter method, which shouldn't be 
# possible for anything but a patient object to access that information. A 
# protected getter method would be perfect for this situation.