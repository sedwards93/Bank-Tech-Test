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
      allow(Time).to receive(:new).and_return Time.new(2011,11,11)
      subject.deposit(100)
      expect(subject.transactions[0]).to eq(["11/11/2011", "100.00", nil, "100.00"])
    end
  end

  describe '#Withdraw' do
    it 'takes one argument of the amount that the user is withdrawing' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end
    it 'updates the account balance accordingly' do
      expect { subject.withdraw(100) }.to change { subject.balance }.from(0).to(-100)
    end
    it 'updates the transactions instance variable' do
      allow(Time).to receive(:new).and_return Time.new(2011,11,11)
      subject.withdraw(100)
      expect(subject.transactions[0]).to eq(["11/11/2011", nil, "-100.00", "-100.00"])
    end
  end

  describe '#Statement' do
    it 'statement method takes no arguemnts' do
      expect(subject).to respond_to(:statement)
    end
    it 'prints out list of transactions' do
      allow(Time).to receive(:new).and_return Time.new(2012,10,01)
      subject.deposit(1000)
      allow(Time).to receive(:new).and_return Time.new(2012,13,01)
      subject.deposit(2000)
      allow(Time).to receive(:new).and_return Time.new(2012,14,01)
      subject.withdraw(500)
      expect(subject.statement).to eq("date || credit || debit || balance\n
                                       14/01/2012 || || 500.00 || 2500.00\n
                                       13/01/2012 || 2000.00 || || 3000.00\n
                                       10/01/2012 || 1000.00 || || 1000.00")
    end
  end
end
