  require "pry"
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status ,:amount
def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount  = amount
  @status  = "pending"
  
end

def valid?
@sender.valid? && @receiver.valid?
end

def execute_transaction
#binding.pry
if self.status == "pending" && self.valid? && sender.balance >= amount
    self.status = "complete"
    sender.balance -= amount 
    receiver.balance += amount 

else 
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
 end

end

def reverse_transfer
  if self.status == "complete" && self.valid? && receiver.balance >= amount
    self.status = "reversed"
    receiver.balance -= amount 
    sender.balance += amount 
  else 
    
  end
end
end

# Transfer instances should be able to reject a transfer if the accounts aren't valid or
#  if the sender doesn't have the money.