require "transactions"

RSpec.describe Transactions do
  
  it "initializes with an empty array of transactions" do
    transactions = Transactions.new()
    expect(transactions.all).to eq([])
  end

  it "adds a new deposit transaction" do
    transactions = Transactions.new()
    transactions.add_transaction("13/09/22", 500.00, "", 0)
    expect(transactions.all[0].date).to eq("13/09/22")
    expect(transactions.all[0].credit).to eq(500.00)
    expect(transactions.all[0].balance).to eq(0)
  end

  it "adds a new withdrawal transaction" do
    transactions = Transactions.new()
    transactions.add_transaction("18/09/22", "", 3000.00, 0)
    expect(transactions.all[0].date).to eq("18/09/22")
    expect(transactions.all[0].debit).to eq(3000.00)
    expect(transactions.all[0].balance).to eq(0)
  end

  it "adds a few transactions" do 
    transactions = Transactions.new()
    transactions.add_transaction("18/09/22", 3000.00, "", 0)
    transactions.add_transaction("19/09/22", "", 500.00, 0)
    transactions.add_transaction("20/09/22", 1000.00, "", 0)
    transactions.add_transaction("21/09/22", "", 300.00, 0)
    expect(transactions.all[0].date).to eq("18/09/22")
    expect(transactions.all[1].debit).to eq(500.00)
    expect(transactions.all[2].credit).to eq(1000.00)
    expect(transactions.all[3].balance).to eq(0)
  end
end