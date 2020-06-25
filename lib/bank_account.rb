class BankAccount

  attr_reader :name, :balance, :status
  attr_writer :balance, :status

  def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
  end

  def deposit(deposit_amount)
      @balance += deposit_amount
  end

  def display_balance
      return "Your balance is $#{@balance}."
  end

  def valid?
      if @status == "open" && @balance > 0
          return true
      else
          return false
      end
  end

  def close_account
      @status = "closed"
  end
end