class Transaction

  def deposit(amount)
    @money_in = amount
  end

  def withdraw(amount)
    @money_out = amount
  end

end
