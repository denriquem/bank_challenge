require 'account'
require 'transaction'

describe Account do
  describe 'check_balance' do
    it 'should return the balance of a user after deposits' do
      transaction = Transaction.new
      transaction_total = transaction.deposit(90) + transaction.deposit(30)
      account = Account.new
      expect(account.balance(transaction_total)).to eq(120)
    end

    it 'should return balance of user after both deposits and withdrawals' do
      transaction = Transaction.new
      transaction_total = transaction.deposit(100) + transaction.withdraw(90)
      account = Account.new
      expect(account.balance(transaction_total)).to eq(10)
    end
  end

end
