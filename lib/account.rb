# account class
class Account

  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
    @transaction_dates = []
  end

  def balance(transaction_total)
    @balance + transaction_total
  end

  def transaction_history(transaction)
    @transactions << transaction
    @transactions.join(', ')
  end

  def date_history(date)
    @transaction_dates << date
  end

end
