# Bank Challenge

## Quickstart

First, clone this repository. Then to run tests:

 ```
 > gem install bundle
 > bundle install
 > bundle exec rspec
 ```

## Areas to improve - currently incomplete
 * Feature tests are not currently working. Need to clarify how to interact with app on irb
 * Currently, the user would have to create their own transaction, create a new instance of the account class, pass their transaction into transaction_history, or balance history. They would also have to call the date method on a new transaction and pass that into the date history method. They would have to repeatedly do that and then pass the resulting transaction_history, balance_history, and date_history, into the print_statement method on the statement class. This is very time-consuming, fiddly and prone to errors.
 * In order to resolve the failing feature test and reduce the users workload from the command line, encapsulation and dependency injection should be used in order to make sure users are only interacting with one class, maybe the transaction class, which then triggers the account and statement classes respectively.
 * This may require restructuring the solution and carefully considering the way that classes interact. Ideally they should cascade into each other rather.
 * At the moment there is huge amount of mocking, especially in the statement spec. Restructuring the solution and sorting out class interactions should go someway to reducing the quantity of code. Using spec helpers to reduce repetition and keep the code DRY would also be useful.
 * Still need to write a full feature test for the user to view the statement.
 * The final print method for the statement class needs some serious refactoring, possible breaking some components into smaller methods and testing for those. From a TDD perspective this was an absolutely huge step. In fact, a similar version should be written out into a feature test and then there should be multiple unit tests in order to solve the feature test.
 * The transaction class does not store any state at the moment it is only methods. it

## Technologies

* Ruby
* rspec (testing suite)
* rubocop (makers scaffolint)
* simpleCov (test coverage)

## User Stories

```
As a user,
So that I can save money,
I would like to be able to make a deposit

As a user,
So that I can take out money,
I would like to make a withdrawal from the bank.

As a user,
So that I can make sure I am not spiraling into crippling debt
I'd like to be able to view my balance:

As a user,
So that I can see when I've made deposits and withdrawals,
I'd like to see the dates of transactions that I've made.

As a user,
So that I can remember the details of my transactions,
I would like to see the amount I was withdrawing or depositing in each transaction

As a user,
So that I can be reminded of my balance, transactions and their dates,
I would like to be able to see my full statement

UML Diagrams: https://www.draw.io/#G1QSgJdfJXd2DWSwCyl06SbwF7nG_K3rGh

```
