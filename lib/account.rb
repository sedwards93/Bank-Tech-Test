# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'
class Account
  attr_reader :balance, :transactions, :transaction, :statement

  def initialize(transaction: Transaction, statement: Statement)
    @balance = 0
    @transactions = []
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    transactions.push(transaction.new(debit: amount, balance: balance))
  end

  def withdraw(amount)
    @balance -= amount
    transactions.push(transaction.new(credit: amount, balance: balance))
  end

  def view_statement
    statement.new(transactions).print
  end
end
