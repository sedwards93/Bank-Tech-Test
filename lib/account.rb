class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transaction = [Date.new, amount, "", @balance]
    transactions.push(transaction)
  end

  def withdraw(amount)
    @balance -= amount
    
  end

  def statement
  end

end
