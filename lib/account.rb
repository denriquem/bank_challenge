# account class
class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  def balance(transaction_total)
    @balance + transaction_total
  end

  def transaction_history(transaction)
    @transactions << transaction
  end

end
