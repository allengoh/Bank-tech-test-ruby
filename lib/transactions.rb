require_relative "./single_transaction"

class Transactions

  attr_reader :all

  def initialize(single_transaction_class = SingleTransaction)
    @all = []
    @single_transaction = single_transaction_class
  end

  def add_transaction(date, credit, debit, balance)
    new_transaction = @single_transaction.new(date, credit, debit, balance)
    @all.push(new_transaction)
  end

end

