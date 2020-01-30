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
      expect{transaction.print}.to output("date || credit || debit || balance\n30/01/2020 || 20 || || 170\n30/01/2020 || 50 || || 150\n30/01/2020 || 100 || || 100\n").to_stdout
    end
  end


end
