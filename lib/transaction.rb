# Transaction class
class Transaction

  def deposit(amount)
    @money_in = amount
  end

  def withdraw(amount)
    @money_out = -amount
  end

  def date
    Time.now.strftime("%d/%m/%Y")
  end

end
