class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def valid?
    self.sender.valid?
    self.receiver.valid?
  end
  def execute_transaction
    if self.status=="pending" and self.valid? and self.sender.balance>=self.amount
        self.sender.balance-=self.amount
        self.receiver.balance+=self.amount
        self.status="complete"
    elsif self.status=="pending" and (not self.valid? or self.sender.balance<self.amount)
      self.status="rejected"
      return "Transaction rejected. Please check your account balance." 
    end
  end
  def reverse_transfer
    if self.status=="complete"
      self.sender.balance+=self.amount
      self.receiver.balance-=self.amount
      self.status="reversed"
    end
  end










end
