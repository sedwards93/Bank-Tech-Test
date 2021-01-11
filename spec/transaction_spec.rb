require 'transaction'

describe Transaction do
  let(:transaction) {Transaction.new(date: "30/12/1993", credit: nil, debit: nil, balance: 0 )}
  describe '#Initialize' do
    it 'transaction is an instance of the Transaction class' do
      expect(subject).to be_an_instance_of(Transaction)
    end
    it 'Instances of transaction class have a date instance variable with default equivalent to today\'s date' do
      allow(Time).to receive(:new).and_return Time.new(2011, 11, 11)
      expect(subject.date).to eq("11/11/2011")
    end
    it 'Instances of transaction class have a credit instance variable with default value of nil' do
      expect(subject.credit).to eq(nil)
    end
    
  end
  
end