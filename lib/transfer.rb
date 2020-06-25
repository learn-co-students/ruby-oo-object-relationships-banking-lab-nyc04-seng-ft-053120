require_relative 'bank_account.rb'
class Transfer
  # your code here
  attr_reader :status
  attr_accessor :sender, :receiver, :amount
    def initialize(sender, receiver, amount)
     @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end
    def valid?
     if @sender.valid? && @receiver.valid?
       true
     end
    end
    def execute_transaction
      if valid? && @status=="pending" && sender.balance > @amount
          @sender.balance -= @amount
          @receiver.balance += @amount
          @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if valid? && @status=="complete" && receiver.balance > @amount
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
    end
end