require_relative "./transactions"

class BankAccount

  attr_reader :balance

  def initialize(transactions_class = Transactions.new())
    @balance = 0
    @transactions = transactions_class
  end
  
  def deposit(date, amount)
    @balance += amount
    @transactions.add_transaction(date, amount, "", @balance)
  end

  def withdraw(date, amount)
    @balance -= amount
    @transactions.add_transaction(date, "", amount, @balance)
  end

  def print_statement(transactions = @transactions)
    if transactions.all.empty?
      return "There are no transactions to print out"
    else
      statement = "#{formatter}\n"
      transactions.all.reverse.each do |transaction|
        statement += "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"  
      end
    end
  end
  

  private 

  def formatter 
    return "date || credit || debit || balance"
  end

end







