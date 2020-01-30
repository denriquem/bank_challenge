# Transaction class
class Transaction

  def initialize(account = Account)
    @account = account.new
  end

  def deposit(amount)
    @account.balance_history(amount)
    @account.transaction_history(amount)
    @account.date_history(Time.now.strftime("%d/%m/%Y"))
    @money_in = amount
  end

  def withdraw(amount)
    @account.balance_history(amount)
    @account.transaction_history(amount)
    @account.date_history(Time.now.strftime("%d/%m/%Y"))
    @money_out = -amount
  end

  def print
    @account.print
  end

end
