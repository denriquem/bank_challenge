require 'transaction'

describe Transaction do
  describe 'deposit' do
    it 'should return the amount deposited by a user' do
      transaction = Transaction.new
      expect(transaction.deposit(90)).to eq(90)
    end
  end

  describe 'withdraw' do
    it 'should return the amount withdrawn by the user' do
      transaction = Transaction.new
      expect(transaction.withdraw(80)).to eq(-80)
    end
  end

end
