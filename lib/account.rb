# frozen_string_literal: true

require_relative 'transaction'
class Account
  attr_reader :balance, :transactions, :transaction

  def initialize(transaction: Transaction)
    @balance = 0
    @transactions = []
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    transactions.unshift(transaction.new(debit: amount, balance: balance))
  end

  def withdraw(amount)
    @balance -= amount
    transactions.unshift(transaction.new(credit: amount, balance: balance))
  end

  def statement
    statement_header
    transactions.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
    nil
  end

  private

  def statement_header
    puts 'date || credit || debit || balance'
  end
end
