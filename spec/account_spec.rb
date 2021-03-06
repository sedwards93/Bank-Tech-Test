# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction) { double :transaction }
  let(:statement) { double :statement }
  let(:account) { Account.new(transaction: transaction, statement: statement) }

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
      it 'creates a new transaction' do
        expect(transaction).to receive(:new).with({ balance: -100, credit: 100 })
        account.withdraw(100)
      end
    end

    describe '#View_statement' do
      it 'view_statement method takes no arguemnts' do
        expect(account).to respond_to(:view_statement)
      end
      it 'Calls on new instance of the statement class' do
        expect(statement).to receive(:print)
        account.view_statement
      end
    end
  end
end
