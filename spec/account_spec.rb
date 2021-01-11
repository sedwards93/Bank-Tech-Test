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

  describe '#Deposit' do
    it 'takes one argument of the amount that the user is depositing' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end
    it 'updates the acccount balance accordingly' do
      expect { subject.deposit(100) }.to change { subject.balance }.from(0).to(100)
    end
  end
end
