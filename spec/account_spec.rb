require 'account'
require 'transaction'

describe Account do
  describe 'check_balance' do
    it 'should return the balance of a user' do
      transaction = Transaction.new
      transaction_total = transaction.deposit(90) + transaction.deposit(30)
      account = Account.new
      expect(account.balance(transaction_total)).to eq(120)
    end
  end
end
