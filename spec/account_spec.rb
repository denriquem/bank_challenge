require 'account'
require 'transaction'

describe Account do

  subject(:account) { described_class.new }
  subject(:transaction) { Transaction.new }

  describe 'check_balance' do
    it 'should return the balance of a user after deposits' do
      transaction_total = transaction.deposit(90) + transaction.deposit(30)
      expect(account.balance(transaction_total)).to eq(120)
    end

    it 'should return balance of user after both deposits and withdrawals' do
      transaction_total = transaction.deposit(100) + transaction.withdraw(90)
      expect(account.balance(transaction_total)).to eq(10)
    end
  end

  describe 'transaction_history' do
    it 'should return an array of transactions for the account' do
      account.transaction_history(transaction.deposit(100))
      account.transaction_history(transaction.deposit(70))
      account.transaction_history(transaction.withdraw(120))
      account.transaction_history(transaction.withdraw(10))
      expected_history = [100, 70, -120, -10, 30]
      expect(account.transaction_history(transaction.deposit(30))).to eq(expected_history)
    end
  end

end
