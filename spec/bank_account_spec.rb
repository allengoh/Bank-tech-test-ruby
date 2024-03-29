require "bank_account"


RSpec.describe BankAccount do

  let(:mock_transactions_class) { instance_double("Transactions") }

  it "initialize with a balance of 0" do 
    mock_bank_account = BankAccount.new(mock_transactions_class)
    expect(mock_bank_account.balance).to eq(0)
  end

  it "returns a balance of 500.00 with a deposit transaction" do 
    bank_account = BankAccount.new(mock_transactions_class)
    allow(mock_transactions_class).to receive(:add_transaction).with("17/09/22", 500.00, "", 500.00)
    bank_account.deposit("17/09/22", 500.00)
    expect(bank_account.balance).to eq(500.00)
  end

  it "returns a balance of 100.00 with a deposit and a withdrawal transaction" do 
    bank_account = BankAccount.new(mock_transactions_class)
    allow(mock_transactions_class).to receive(:add_transaction).with("17/09/22", 500.00, "", 500.00)
    allow(mock_transactions_class).to receive(:add_transaction).with("18/09/22", "", 300.00, 200.00)
    bank_account.deposit("17/09/22", 500.00)
    bank_account.withdraw("18/09/22", 300.00)
    expect(bank_account.balance).to eq(200.00)
  end

  it "returns a no transaction to print out statement if there are no transactions" do 
    bank_account = BankAccount.new(mock_transactions_class)
    allow(mock_transactions_class).to receive(:all).and_return([])
    expect(bank_account.print_statement()).to eq("There are no transactions to print out")    
  end

  it "prints out a statement when there is a transaction" do 
    bank_account = BankAccount.new(mock_transactions_class)
    allow(mock_transactions_class).to receive(:all).and_return([
      instance_double("SingleTransaction", date: "17/09/22", debit: "", credit: 500.00, balance: 500.00),
      instance_double("SingleTransaction", date: "18/09/22", debit: 300.00, credit: "", balance: 200.00)
    ])
    expect { bank_account.print_statement() }.to output("date || credit || debit || balance\n18/09/22 ||  || 300.0 || 200.0\n17/09/22 || 500.0 ||  || 500.0\n").to_stdout    
  end

end