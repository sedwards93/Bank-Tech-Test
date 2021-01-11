class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transaction = [format_date, amount, "", @balance]
    transactions.push(transaction)
  end

  def withdraw(amount)
    @balance -= amount
    
  end

  def statement
  end

  private

  def format_date
    Time.new.strftime("%d/%m/%Y")
  end

end
