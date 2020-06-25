require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :pending, :status, :amount 
   
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
   
  end
  
  def valid?
    #if sender and receiver.status are open,return true
    
   sender.valid? && receiver.valid?
    #calls on the sender and reciver's #valid? methods
  end

  def execute_transaction
    balance = @balance - @amount
  end
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
# puts "Hi"
# puts "OMG We did it"

