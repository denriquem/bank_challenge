class Statement

  def print(current_account)
    @transactions = current_account
  end

  def print_statement(dates, transactions, balance)
   @dates = dates
     date_array = @dates.split(', ').reverse
    @transactions = transactions
     transactions_array = @transactions.split(', ').reverse
    @balance = balance
     balance_array = @balance.split(', ').reverse
     x = date_array.zip(transactions_array, balance_array)
    puts "date || credit || debit || balance"
    x.each { |element|
      if element[1].to_i < 0
        puts "#{element[0]} || || #{element[1].gsub('-', '')} || #{element[2]}"
      else
        puts "#{element[0]} || #{element[1]} || || #{element[2]}"
      end
    }.join("")
  end

end
