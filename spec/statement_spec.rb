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

    it 'should print a table with date history, credit, debit and balance of each transaction' do
      allow(transaction).to receive(:deposit).and_return(1000)
      allow(account).to receive(:transaction_history).and_return("1000.00")
      account.transaction_history(transaction.deposit(1000))
      allow(transaction).to receive(:deposit).and_return(2000)
      allow(account).to receive(:transaction_history).and_return("1000.00, 2000.00")
      account.transaction_history(transaction.deposit(2000))
      allow(transaction).to receive(:withdraw).and_return(-500)
      allow(account).to receive(:transaction_history).and_return("1000.00, 2000.00, -500.00")
      transactions = account.transaction_history(transaction.withdraw(500))

      allow(transaction).to receive(:date) { '10/01/2012' }
      allow(account).to receive(:date_history).and_return('10/01/2012')
      account.date_history(transaction.date)
      allow(transaction).to receive(:date) { '13/01/2012' }
      allow(account).to receive(:date_history).and_return('10/01/2012, 13/01/2012')
      account.date_history(transaction.date)
      allow(transaction).to receive(:date) { '14/01/2012' }
      allow(account).to receive(:date_history).and_return('10/01/2012, 13/01/2012, 14/01/2012')
      dates = account.date_history(transaction.date)

      allow(transaction).to receive(:deposit).and_return(1000)
      allow(account).to receive(:balance_history).and_return('1000.00')
      account.balance_history(transaction.deposit(1000))
      allow(transaction).to receive(:deposit).and_return(2000)
      allow(account).to receive(:balance_history).and_return('1000.00, 3000.00')
      account.balance_history(transaction.deposit(2000))
      allow(transaction).to receive(:withdraw).and_return(-500)
      allow(account).to receive(:balance_history).and_return('1000.00, 3000.00, 2500.00')
      balance = account.balance_history(transaction.withdraw(500))

      expect { statement.print_statement(dates, transactions, balance) }.to output(
"date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
").to_stdout
    end
  end

end
