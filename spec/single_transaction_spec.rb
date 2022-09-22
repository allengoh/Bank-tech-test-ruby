require "single_transaction"

RSpec.describe SingleTransaction do 

  it "returns the date from a single transaction" do 
    transaction = SingleTransaction.new('13/09/22', 500.00, 0, 0)
    expect(transaction.date).to eq('13/09/22')  
  end

  it "returns the amount of deposit from a single transaction " do 
    transaction = SingleTransaction.new('13/09/22', 1000.00, 0, 0)
    expect(transaction.credit).to eq(1000.00)  
  end

  it "returns the amount of withdrawal from a single transaction " do 
    transaction = SingleTransaction.new('13/09/22', 0, 2987.00, 0)
    expect(transaction.debit).to eq(2987.00)  
  end

  it "returns the balance from a single transaction " do 
    transaction = SingleTransaction.new('13/09/22', 0, 0, 3287.50)
    expect(transaction.balance).to eq(3287.50)  
  end

end