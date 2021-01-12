# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction) { double :transaction }
  let(:account) { Account.new(transaction: transaction) }

  describe '#Initialize' do
    it 'account is an instance of the Account class' do
      expect(account).to be_an_instance_of(Account)
    end
    it 'instances of the Account class are initialized with a balance of 0' do
      expect(account.balance).to eq(0)
    end
    it 'instances of the Account class are initialized with a transactions property of an empty array' do
      expect(account.transactions).to be_an_instance_of(Array)
    end
    it 'instances of the Account class are initialized with a Transaction class' do
      expect(account).to respond_to(:transaction)
    end
  end

  describe '#Deposit & #Withdrawal' do
    before do
      allow(transaction).to receive(:new)
    end

    describe '#Deposit' do
      it 'takes one argument of the amount that the user is depositing' do
        expect(account).to respond_to(:deposit).with(1).argument
      end
      it 'updates the acccount balance accordingly' do
        expect { account.deposit(100) }.to change { account.balance }.from(0).to(100)
      end
      it 'updates the transactions instance variable' do
        expect { account.deposit(100) }.to change { account.transactions.length }.by(1)
      end
      it 'creates a new transaction' do
        expect(transaction).to receive(:new).with({ balance: 100, debit: 100 })
        account.deposit(100)
      end
    end

    describe '#Withdraw' do
      it 'takes one argument of the amount that the user is withdrawing' do
        expect(account).to respond_to(:withdraw).with(1).argument
      end
      it 'updates the account balance accordingly' do
        expect { account.withdraw(100) }.to change { account.balance }.from(0).to(-100)
      end
      it 'updates the transactions instance variable' do
        expect { account.withdraw(100) }.to change { account.transactions.length }.by(1)
      end
      it 'creates a new transaction' do
        expect(transaction).to receive(:new).with({ balance: -100, credit: 100 })
        account.withdraw(100)
      end
    end

    describe '#Statement' do
      it 'statement method takes no arguemnts' do
        expect(account).to respond_to(:statement)
      end
      it 'prints out list of transactions' do
        msg = "date || credit || debit || balance\n"
        expect { account.statement }.to output(msg).to_stdout
      end
    end
  end
end
