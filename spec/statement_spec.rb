# require 'account'
# require 'transaction'
# require 'statement'
#
# describe Statement do
#
#   subject(:statement) { Statement.new }
#   subject(:account) { Account.new }
#   subject(:transaction) { Transaction.new }
#
#
#   describe 'print' do
#     it 'should print a statement with the value of each transaction' do
#       account.transaction_history(transaction.deposit(100))
#       account.transaction_history(transaction.deposit(70))
#       p current_account = account.transaction_history(transaction.withdraw(120))
#       expect(statement.print(current_account)).to eq(
#         "100",
#         "70",
#         "-120")
#     end
#   end
#
# end
