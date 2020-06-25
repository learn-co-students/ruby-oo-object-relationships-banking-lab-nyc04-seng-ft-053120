class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if status == 'pending' && self.valid? && self.sender.balance >= amount
        self.sender.balance -= self.amount 
        self.receiver.balance += self.amount 
        self.status = 'complete'
    else 
      rejected
    end
  end

  def reverse_transfer
    if self.valid? && self.receiver.balance >= amount && self.status == 'complete'
      receiver.balance -= amount
      sender.balance += amount 
      self.status = 'reversed'
    else 
      rejected
    end
  end

  private 
  def rejected
    self.status = 'rejected'
    return "Transaction rejected. Please check your account balance."
  end
end
