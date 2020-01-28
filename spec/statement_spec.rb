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
      allow(account).to receive(:transaction_history).and_return("100")
      account.transaction_history(transaction.deposit(100))
      allow(transaction).to receive(:deposit).and_return(70)
      allow(account).to receive(:transaction_history).and_return("100, 70")
      account.transaction_history(transaction.deposit(70))
      allow(transaction).to receive(:withdraw).and_return(-120)
      allow(account).to receive(:transaction_history).and_return("100, 70, -120")
      current_account_transactions = account.transaction_history(transaction.withdraw(120))
      expect(statement.print(current_account_transactions)).to eq("100, 70, -120")
    end

    # it 'should print a statement with the date of each transaction' do
    #   allow(transaction).to receive(:date) { '14/01/2020' }
    #   allow(account).to receive(:date_history).and_return('14/01/2020')
    #   account.date_history(transaction.date)
    #   allow(transaction).to receive(:date) { '20/01/2020' }
    #   allow(account).to receive(:date_history).and_return('14/01/2020, 20/01/2020')
    #   current_account_dates = account.date_history(transaction.date)
    #   expect(statement.print(current_account_dates)).to eq('14/01/2020, 20/01/2020')
    # end

#     it 'should print a table with date history, credit, debit and balance of each transaction' do
#       allow(transaction).to receive(:deposit).and_return(1000)
#       allow(account).to receive(:transaction_history).and_return("1000")
#       account.transaction_history(transaction.deposit(1000))
#       allow(transaction).to receive(:deposit).and_return(2000)
#       allow(account).to receive(:transaction_history).and_return("1000, 2000")
#       account.transaction_history(transaction.deposit(2000))
#       allow(transaction).to receive(:withdraw).and_return(-500)
#       allow(account).to receive(:transaction_history).and_return("1000, 2000, -500")
#       transactions = account.transaction_history(transaction.withdraw(500))
#
#       allow(transaction).to receive(:date) { '10/01/2012' }
#       allow(account).to receive(:date_history).and_return('10/01/2012')
#       account.date_history(transaction.date)
#       allow(transaction).to receive(:date) { '13/01/2012' }
#       allow(account).to receive(:date_history).and_return('10/01/2012, 13/01/2012')
#       account.date_history(transaction.date)
#       allow(transaction).to receive(:date) { '14/01/2012' }
#       allow(account).to receive(:date_history).and_return('10/01/2012, 13/01/2012', '14/01/12')
#       dates = account.date_history(transaction.date)
#
#       allow(transaction).to receive(:deposit).and_return(1000)
#       allow(account).to receive(:balance).and_return(1000)
#       account.balance
#
#
#       expect(statement.print_full_statement(dates, transactions, balance)).to eq(
# "date || credit || debit || balance
# 14/01/2012 || || 500.00 || 2500.00
# 13/01/2012 || 2000.00 || || 3000.00
# 10/01/2012 || 1000.00 || || 1000.00")
#     end
  end

end
