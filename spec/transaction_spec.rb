# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new(credit: 500, debit: nil, balance: 1000) }
  describe '#Initialize' do
    it 'transaction is an instance of the Transaction class' do
      expect(subject).to be_an_instance_of(Transaction)
    end
    it 'Instances of transaction class have a date instance variable with default equivalent to today\'s date' do
      allow(Time).to receive(:new).and_return Time.new(2011, 11, 11)
      expect(subject.date).to eq('11/11/2011')
    end
    it 'Instances of transaction class have a credit instance variable with default value of nil' do
      expect(subject.credit).to eq(nil)
    end
    it 'Instances of transaction class have a debit instance variable with default value of nil' do
      expect(subject.debit).to eq(nil)
    end
    it 'Instances of transaction class have a balance instance variable with default value of nil' do
      expect(subject.balance).to eq(nil)
    end
    it 'Figures are formatted correctly to show two decimal places' do
      expect(transaction.balance).to eq('1000.00')
    end
  end
end
