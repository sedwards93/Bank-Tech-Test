require 'transaction'

describe Transaction do

  describe '#Initialize' do
    it 'transaction is an instance of the Transaction class' do
      expect(subject).to be_an_instance_of(Transaction)
    end
  end
  
end