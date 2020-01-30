# account class
class Account

  def initialize(statement = Statement)
    @statement = statement
    @balance = 0
    @balance_history = []
    @transactions = []
    @transaction_dates = []
  end

  def balance_history(transaction)
    @balance_history << @balance += transaction
    @balance_history.join(', ')
  end

  def transaction_history(transaction)
    @transactions << transaction
    @transactions.join(', ')
  end

  def date_history(date)
    @transaction_dates << date
    @transaction_dates.join(', ')
  end

  def print
    @statement.new.print_statement(@transaction_dates.join(', '), @transactions.join(', '), @balance_history.join(', '))
  end

end
