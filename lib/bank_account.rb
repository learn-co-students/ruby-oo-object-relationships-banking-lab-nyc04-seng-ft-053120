class BankAccount
    attr_accessor :balance, :status, :amount, :broke
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @amount = amount
        @broke = 0
    end

    def deposit(amount)
        @balance = @balance + amount
        @balance
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end
    #if status is open and balance is > 0 then valid 
    def valid?
        if @status == "open" && @balance > 0
            return true
        else
            @broke = false

        end
    end
    def close_account
        @status = "closed"
    end

end
