# account class
class Account
  def initialize
    @balance = 0
  end

  def balance(transaction_total)
    @balance + transaction_total
  end
end
