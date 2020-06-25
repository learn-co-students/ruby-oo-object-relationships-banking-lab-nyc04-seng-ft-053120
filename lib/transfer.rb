class Transfer

  attr_writer :status
  attr_reader :status, :sender, :receiver, :amount
  @@all = []

  #initial setter
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if @status == "complete"
      return nil
    end
    if self.sender.balance < self.amount || !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      @status = "complete"
    end
  end

  def reverse_transfer
    last_transaction = @@all[-1]
    if last_transaction.status == "complete"
      self.sender.balance += last_transaction.amount
      self.receiver.balance -= last_transaction.amount
      self.status = "reversed"
    end
  end
end
