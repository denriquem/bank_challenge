require 'account'
require 'transaction'
require 'statement'

describe Statement do

  subject(:statement) { Statement.new }
  let(:account) { double(:account) }
  let(:transaction) { double(:transaction) }


  describe 'print' do
    it 'should print a statement with the value of each transaction' do
      allow(transaction).to receive(:deposit).and_return(100)
      allow(account).to receive(:transaction_history).and_return([100])
      account.transaction_history(transaction.deposit(100))
      allow(transaction).to receive(:deposit).and_return(70)
      allow(account).to receive(:transaction_history).and_return([100, 70])
      account.transaction_history(transaction.deposit(70))
      allow(transaction).to receive(:withdraw).and_return(-120)
      allow(account).to receive(:transaction_history).and_return("100, 70, -120")
      current_account = account.transaction_history(transaction.withdraw(120))
      expect(statement.print(current_account)).to eq("100, 70, -120")
    end
  end

end
