# Bank tech test

## Specification

### Requirements

You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see
```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```
### User stories

```
As a customer
So I can make financial transactions
I would like to open a bank account
```

```
As a customer
So I can make purchases
I would like to withdraw money from the bank 
```

```
As a customer
So I can grow my savings
I would like to deposit money into the bank
```

```
As a customer
So I can keep track of my financial transactions and account balance
I would like to be able to print out a statement
```
### Design

First, I created a single transaction class to hold a transaction as an object

Sample code:
```ruby
class SingleTransaction
end
```

Then, I created a transactions class to hold the single transactions objects in an array

Sample code:
```ruby
require_relative "./single_transaction"

class Transactions

  attr_reader :all

  def initialize(single_transaction_class = SingleTransaction)
    @all = []
    @single_transaction = single_transaction_class
  end

end
```

Lastly, I created a bank account class to be able to deposit and withdraw money.
The bank account class is also able to print a statement out using the transactions class 
through dependency injection.

Sample code:
```ruby
require_relative "./transactions"

class BankAccount

  attr_reader :balance

  def initialize(transactions_class = Transactions.new())
    @balance = 0
    @transactions = transactions_class
  end

  def deposit(date, amount)
  end

  def withdraw(date, amount)
  end

  def print_statement(transactions = @transactions)
  end

end

```


### Quick start

* Clone this repository
* Enter `bundle install` in the terminal
* Enter `irb` in the terminal

### Example of usage in irb terminal

```
Bank-tech-test-ruby git:(main)  irb
3.0.0 :001 > require('./lib/bank_account')
 => true 
3.0.0 :002 > account = BankAccount.new()
 => #<BankAccount:0x00007fb48e014560 @balance=0, @transactions=#<Transactions:0x00007fb48e00ffd8 @all=[], @single_transaction=SingleTransaction>> 
3.0.0 :003 > account.deposit("10/01/2023", 1000.00)
 => [#<SingleTransaction:0x00007fb48e3f5dc8 @date="10/01/2023", @credit=1000.0, @debit="", @balance=1000.0>] 
3.0.0 :004 > account.deposit("13/01/2023", 2000.00)
 => [#<SingleTransaction:0x00007fb48e3f5dc8 @date="10/01/2023", @credit=1000.0, @debit="", @balance=1000.0>, #<SingleTransaction:0x00007fb48e38c2d8 @date="13/01/2023", @credit=2000.0, @debit="", @balance=3000.0>] 
3.0.0 :005 > account.withdraw("14/01/2023", 500.00)
 => [#<SingleTransaction:0x00007fb48e3f5dc8 @date="10/01/2023", @credit=1000.0, @debit="", @balance=1000.0>, #<SingleTransaction:0x00007fb48e38c2d8 @date="13/01/2023", @credit=2000.0, @debit="", @balance=3000.0>, #<SingleTransaction:0x00007fb48e327270 @date="14/01/2023", @credit="", @debit=500.0, @balance=2500.0>] 
3.0.0 :006 > account.print_statement()
date || credit || debit || balance
14/01/2023 ||  || 500.0 || 2500.0
13/01/2023 || 2000.0 ||  || 3000.0
10/01/2023 || 1000.0 ||  || 1000.0
 => [#<SingleTransaction:0x00007fb48e327270 @date="14/01/2023", @credit="", @debit=500.0, @balance=2500.0>, #<SingleTransaction:0x00007fb48e38c2d8 @date="13/01/2023", @credit=2000.0, @debit="", @balance=3000.0>, #<SingleTransaction:0x00007fb48e3f5dc8 @date="10/01/2023", @credit=1000.0, @debit="", @balance=1000.0>] 
3.0.0 :007 > quit
```

### RSpec

* All tests passed

![This is an image of RSpec tests passing](/assets/images/RSpec-pass.png)

## Dependencies

This project uses `rspec` for testing and `simplecov` for code coverage analysis.

Gemfile
```ruby
# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"

group :test do
  gem "rspec", "~> 3.11"
  gem "simplecov", require: false
  gem "simplecov-console", require: false
end
```

