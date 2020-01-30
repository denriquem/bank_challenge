# Transaction class
require_relative 'account'
require_relative 'statement'
class Transaction

  def initialize(account = Account.new)
    @account = account
  end

  def deposit(amount)
    @account.balance_history(amount)
    @account.transaction_history(amount)
    @account.date_history(Time.now.strftime("%d/%m/%Y"))
    @money_in = amount
  end

  def withdraw(amount)
    @account.balance_history(-amount)
    @account.transaction_history(-amount)
    @account.date_history(Time.now.strftime("%d/%m/%Y"))
    @money_out = -amount
  end

  def print
    @account.print
  end

end
