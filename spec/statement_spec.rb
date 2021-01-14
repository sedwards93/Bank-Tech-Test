# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:transaction) { double :transaction, date: '11/11/2011', credit: nil, debit: 500, balance: 1000 }
  let(:transaction2) { double :transaction2, date: '12/11/2011', credit: 100, debit: nil, balance: 900 }
  let(:statement) { Statement.new([transaction, transaction2]) }

  describe '#Initialize' do
    it 'statement is an instance of the Statement class' do
      expect(statement).to be_an_instance_of(Statement)
    end
    it 'instances of the Statement class are initialized with a transactions variable' do
      expect(statement).to respond_to(:transactions)
    end
    it 'instances of the Statement class are initialized with a transactions property of an empty array' do
      # expect(statement.transactions).to be_an_instance_of(Array)
    end
  end

  describe '#print' do
    it 'calls the statement header method' do
      expect(statement).to receive(:statement_header)
      statement.print
    end
    it 'prints the statement in reverse order' do
      output = "date || credit || debit || balance\n12/11/2011 || 100 ||  || 900\n11/11/2011 ||  || 500 || 1000\n"
      expect { statement.print }.to output(output).to_stdout
    end
  end
end

# class Statement
#   attr_reader :transactions

#   def initialize(transactions)
#     @transactions = transactions
#   end

#   def print
#     statement_header
#     transactions.reverse_each do |transaction|
#       puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
#     end
#     nil
#   end

#   private

#   def statement_header
#     puts 'date || credit || debit || balance'
#   end

# end
