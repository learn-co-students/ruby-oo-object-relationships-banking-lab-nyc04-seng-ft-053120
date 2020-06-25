class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == 'pending' && self.sender.balance >= self.amount
         self.sender.balance -= self.amount
         self.receiver.balance += self.amount
         self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete' 
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = 'reversed'
    else
      "There is no transaction"
    end

  end


end
