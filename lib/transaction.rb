class Transaction
  attr_reader :date, :credit, :debit, :balance
  def initialize(date: Time.new, credit: nil , debit: nil, balance: nil)
    @date = date.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
    @balance = balance
  end
end