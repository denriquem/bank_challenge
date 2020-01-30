# Bank Challenge

## Quickstart

First, clone this repository. Then to run tests:

 ```
 > gem install bundle
 > bundle install
 > bundle exec rspec
 ```

## Areas to improve - currently incomplete
 * Mocking desperately needs refactoring to account for the classes now interacting together through depositing or withdrawing money.
 * Output returns a nasty string at the bottom, related to an extreme and ugly method in the statement class. This needs refactoring urgently.
 * The final print method for the statement class needs some serious refactoring, possible breaking some components into smaller methods and testing for those. From a TDD perspective this was a huge step and more fine-grained tests should have been used to build up to the solution.
 * Join called on the end of the print method of the account class needs to be moved to a more elegant place
 * Overall the code is not particularly clear and simple.
 * The code needs to account for edgecases. Currenly it only works when an transaction is compeleted. It does not handle a blank statement, or any incorrect input.
 * The transaction class does not store any state at the moment it is only methods. it

## Technologies

* Ruby
* rspec (testing suite)
* rubocop (makers scaffolint)
* simpleCov (test coverage)

## How to run a feature test

```
> require './lib/transaction.rb'
> transaction = Transaction.new
> transaction.deposit(100)
> transaction.withdraw(50)
> transaction.deposit(20)
> transaction.print

```

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
