require 'account'

describe Account do
  describe '#Initialize' do
    it 'account is an instance of the Account class' do
      expect(subject).to be_an_instance_of(Account)
    end
    it 'instances of the Account class are initialized with a balance of 0' do
      expect(subject.balance).to eq(0)
    end
    it 'instances of the Account class are initialized with a transactions property of an empty array' do
      expect(subject.transactions).to be_an_instance_of(Array)
    end
  end

  describe '#Deposit' do
    it 'takes one argument of the amount that the user is depositing' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end
    it 'updates the acccount balance accordingly' do
      expect { subject.deposit(100) }.to change { subject.balance }.from(0).to(100)
    end
    it 'updates the transactions instance variable' do
      subject.deposit(100)
      expect(subject.transactions[0]).to eq(["11/01/2021", "100.00", nil, "100.00"])
    end
  end

  describe '#Withdraw' do
    it 'takes one argument of the amount that the user is withdrawing' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end
    it 'updates the account balance accordingly' do
      expect { subject.withdraw(100) }.to change { subject.balance }.from(0).to(-100)
    end
  end

  describe '#Statement' do
    it 'statement method takes no arguemnts' do
      expect(subject).to respond_to(:statement)
    end
  end
end
