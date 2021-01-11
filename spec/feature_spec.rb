require 'account'
require 'transaction'

describe 'Example transaction history' do
  let(:account) {Account.new}
    
    context 'Multi-transaction statement' do
      it 'Prints the correct message to the st_out' do
        msg = "date || credit || debit || balance\n11/01/2021 || 500.00 ||  || 2500.00\n11/01/2021 ||  || 2000.00 || 3000.00\n11/01/2021 ||  || 1000.00 || 1000.00\n"
        account.deposit(1000)
        account.deposit(2000)
        account.withdraw(500)
        expect { account.statement }.to output(msg).to_stdout
      end
    end

end