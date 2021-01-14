# frozen_string_literal: true

class Statement
  
  def print(transactions)
    statement_header
    transactions.reverse_each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
    nil
  end

  private

  def statement_header
    puts 'date || credit || debit || balance'
  end
end
