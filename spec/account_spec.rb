require 'account'

describe Account do 
  describe '#Initialize' do
    it 'account is an instance of the Account class' do
      expect(subject).to be_an_instance_of(Account)
    end
    it 'instances of the Account class are initialized with a balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end
end