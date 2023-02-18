require "transactions"

RSpec.describe Transactions do

  let(:mock_single_transaction_class) { double("SingleTransaction") }
  
  it "initializes with an empty array of transactions" do
    transactions = Transactions.new(mock_single_transaction_class)
    expect(transactions.all).to eq([])
  end

  it "adds a new deposit transaction" do
    transactions = Transactions.new(mock_single_transaction_class)
    new_transaction = instance_double("SingleTransaction", date: "13/09/22", credit: 500.00, debit: "", balance: 0)
    allow(mock_single_transaction_class).to receive(:new).with("13/09/22", 500.00, "", 0).and_return(new_transaction)
    transactions.add_transaction("13/09/22", 500.00, "", 0)
    expect(transactions.all[0].date).to eq("13/09/22")
    expect(transactions.all[0].credit).to eq(500.00)
    expect(transactions.all[0].balance).to eq(0)
    expect(transactions.all.size).to eq(1)
  end

  it "adds a new withdrawal transaction" do
    transactions = Transactions.new(mock_single_transaction_class)
    new_transaction = instance_double("SingleTransaction", date: "18/09/22", credit: "", debit: 3000.00, balance: 0)
    allow(mock_single_transaction_class).to receive(:new).with("18/09/22", "", 3000.00, 0).and_return(new_transaction)
    transactions.add_transaction("18/09/22", "", 3000.00, 0)
    expect(transactions.all[0].date).to eq("18/09/22")
    expect(transactions.all[0].debit).to eq(3000.00)
    expect(transactions.all[0].balance).to eq(0)
  end

  it "adds a few transactions" do 
    transactions = Transactions.new(mock_single_transaction_class)
    new_transaction_1 = instance_double("SingleTransaction", date: "18/09/22", credit: 3000.00 , debit: "", balance: 0)
    new_transaction_2 = instance_double("SingleTransaction", date: "19/09/22", credit: "", debit: 500.00, balance: 0)
    new_transaction_3 = instance_double("SingleTransaction", date: "20/09/22", credit:1000.00, debit: "", balance: 0)
    new_transaction_4 = instance_double("SingleTransaction", date: "21/09/22", credit: "", debit: 300.00, balance: 0)
    allow(mock_single_transaction_class).to receive(:new).with("18/09/22", 3000.00, "", 0).and_return(new_transaction_1)
    allow(mock_single_transaction_class).to receive(:new).with("19/09/22", "", 500.00, 0).and_return(new_transaction_2)
    allow(mock_single_transaction_class).to receive(:new).with("20/09/22", 1000.00, "", 0).and_return(new_transaction_3)
    allow(mock_single_transaction_class).to receive(:new).with("21/09/22", "", 300.00, 0).and_return(new_transaction_4)
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