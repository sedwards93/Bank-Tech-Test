# frozen_string_literal: true

require 'account'
require 'transaction'

describe 'Example transaction history' do
  let(:account) { Account.new }

  context 'Multi-transaction statement' do
    it 'Prints the correct message to the st_out' do
      allow(Time).to receive(:new).and_return Time.new(2011, 11, 11)
      msg = "date || credit || debit || balance\n11/11/2011 || 500.00 ||  || 2500.00
11/11/2011 ||  || 2000.00 || 3000.00\n11/11/2011 ||  || 1000.00 || 1000.00\n"
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
      expect { account.statement }.to output(msg).to_stdout
    end
  end
end
