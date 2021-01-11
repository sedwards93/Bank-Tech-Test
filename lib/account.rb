# frozen_string_literal: true
require_relative 'transaction'
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transaction = Transaction.new(debit: amount, balance: balance)
    transactions.unshift(transaction)
  end

  def withdraw(amount)
    @balance -= amount
    transaction = Transaction.new(credit: amount, balance: balance)
    transactions.unshift(transaction)
  end

  def statement
    puts 'date || credit || debit || balance'
    transactions.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
  end

end
