# account class
class Account

  attr_reader :transactions

  def initialize
    @balance = 0
    @balance_history = []
    @transactions = []
    @transaction_dates = []
  end

  def balance_history(transaction_total)
    @balance_history << @balance += transaction_total
    @balance_history.join(', ')
  end

  def transaction_history(transaction)
    @transactions << transaction
    @transactions.join(', ')
  end

  def date_history(date)
    @transaction_dates << date
  end

end
