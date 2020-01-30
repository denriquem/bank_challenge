require 'account'
require 'transaction'

describe Account do

  let(:transaction) { double(:transaction) }
  subject(:account) { described_class.new }

  describe 'check_balance' do
    it 'should return a list of balances following deposits' do
      allow(transaction).to receive(:deposit).and_return(90)
      account.balance_history(transaction.deposit(90))
      allow(transaction).to receive(:deposit).and_return(30)
      expect(account.balance_history(transaction.deposit(30))).to eq('90, 120')
    end

    it 'should return balance of user after both deposits and withdrawals' do
      allow(transaction).to receive(:deposit).and_return(100)
      account.balance_history(transaction.deposit(100))
      allow(transaction).to receive(:withdraw).and_return(-90)
      expect(account.balance_history(transaction.withdraw(90))).to eq('100, 10')
    end
  end

  describe 'transaction_history' do
    it 'should return a string listing the transactions for the account' do
      allow(transaction).to receive(:deposit).and_return(100)
      account.transaction_history(transaction.deposit(100))
      allow(transaction).to receive(:deposit).and_return(70)
      account.transaction_history(transaction.deposit(70))
      allow(transaction).to receive(:withdraw).and_return(-120)
      account.transaction_history(transaction.withdraw(120))
      allow(transaction).to receive(:withdraw).and_return(-10)
      account.transaction_history(transaction.withdraw(10))
      allow(transaction).to receive(:deposit).and_return(30)
      expected_history = "100, 70, -120, -10, 30"
      expect(account.transaction_history(transaction.deposit(30))).to eq(expected_history)
    end
  end

  describe 'date_histroy' do
    it 'should return an list of dates for each transaction' do
      allow(transaction).to receive(:date) { '14/01/2020' }
      account.date_history(transaction.date)
      allow(transaction).to receive(:date) { '20/01/2020' }
      account.date_history(transaction.date)
      allow(transaction).to receive(:date) { Time.now.strftime("%d/%m/%Y") }
      expected_date_history = "14/01/2020, 20/01/2020, #{Time.now.strftime("%d/%m/%Y")}"
      expect(account.date_history(transaction.date)).to eq(expected_date_history)
    end
  end

end
