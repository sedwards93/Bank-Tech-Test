# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transaction = [format_date, format_money(amount), nil, format_money(balance)]
    transactions.unshift(transaction)
  end

  def withdraw(amount)
    @balance -= amount
    transaction = [format_date, nil, format_money(amount), format_money(balance)]
    transactions.unshift(transaction)
  end

  def statement
    puts 'date || credit || debit || balance'
    transactions.each do |transaction|
      puts "#{transaction[0]} || #{transaction[1]} || #{transaction[2]} || #{transaction[3]}\n"
    end
  end

  private

  def format_date
    Time.new.strftime('%d/%m/%Y')
  end

  def format_money(amount)
    '%.2f' % amount
  end
end
