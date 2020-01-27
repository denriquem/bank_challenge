class Statement

  def print(current_account)
    @transactions = current_account
    @transactions.each do |transaction|
      puts transaction
    end
  end

end
