require 'pry'
require_relative "bank_account.rb"
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    sender.valid? && receiver.valid?
  end

    def execute_transaction

      # if valid? && @status == "pending" && sender.balance > @amount
      if (balance < amount) == false
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else 
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
      # if !@sender.balance < @amount
      #   @status = "rejected"
      #   return "Transaction rejected. Please check your account balance."
      # else @status == "pending"
      #   @sender.balance -= @amount
      # # binding.pry
      #   @receiver.balance += @amount
      #   @status = "complete"
      # end
      # binding.pry
    end
    def reverse_transfer
      if self.status == "complete"
        self.sender.balance += amount
        @receiver.balance -= amount
        self.status = "reversed"
      end
    end

end
