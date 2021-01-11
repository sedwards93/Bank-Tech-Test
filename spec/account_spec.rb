require 'account'

describe Account do 
  describe '#Initialize' do
    it 'account is an instance of the Account class' do
      expect(subject).to be_an_instance_of(Account)
    end
  end
end