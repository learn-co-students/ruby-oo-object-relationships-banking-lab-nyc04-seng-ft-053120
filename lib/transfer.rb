require "pry"
require_relative "bank_account.rb"
@@counter = 0
class Transfer
  # your code here
  # creates a transaction between 2 instances
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
   
    @status = "pending"
    @amount = amount
    # binding.pry
  end
  
  def valid?
    self.sender.valid?
    self.receiver.valid?
  end

  def execute_transaction
    # change the balance of sender + receiver by amount
    # want to change now the status of the transfer to "complete"
    # how can we ensure this transfer only happens once
    # we need to check if the bank account even has enough money to do the transaction
    # when this is created we set it pending if that ever changes its a way to ensure it only occurs once
    # what happens if transaction cant happen?
    if self.valid? && sender.balance > @amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end     
  end
  # can only act if pending is no longer there
  # remove money from reciever
  #  sender gets their money back
  def reverse_transfer
   
    if self.status != "pending"
     
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
    
  end

end
