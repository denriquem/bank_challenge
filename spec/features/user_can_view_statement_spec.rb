require 'transaction'
require 'statement'
require 'account'

describe Transaction do

  describe 'Viewing statement' do
    it 'should allow user to view a statement after depoists and withdawals before any transactions have taken place' do
      transaction = Transaction.new
      transaction.deposit(100)
      transaction.withdraw(50)
      transaction.deposit(20)
      expect { transaction.print }.to output("date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || 20 || || 70\n#{Time.now.strftime("%d/%m/%Y")} || || 50 || 50\n#{Time.now.strftime("%d/%m/%Y")} || 100 || || 100\n").to_stdout
    end
  end

end
