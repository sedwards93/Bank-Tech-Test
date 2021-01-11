class Transaction
  attr_reader :date, :credit, :debit, :balance
  def initialize(date: Time.new, credit: nil , debit: nil, balance: nil)
    @date = date.strftime('%d/%m/%Y')
    @credit = format_money(credit)
    @debit = format_money(debit)
    @balance = format_money(balance)
  end


  private

  def format_money(amount)
    '%.2f' % amount unless amount == nil
  end

end