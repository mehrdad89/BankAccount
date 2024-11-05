// BankAccount.gsp - Bank Account Class
package bank

class BankAccount {
  
  // Properties
  var public accountNumber: String
  var public accountHolder: String
  var public balance: Decimal

  // Constructor
  construct(accountNumber: String, accountHolder: String, initialDeposit: Decimal) {
    this.accountNumber = accountNumber
    this.accountHolder = accountHolder
    this.balance = initialDeposit
  }

  // Method to Deposit Money
  function deposit(amount: Decimal) {
    if (amount > 0) {
      this.balance += amount
      print("Deposited ${amount}. New Balance: ${this.balance}")
    } else {
      print("Invalid deposit amount.")
    }
  }

  // Method to Withdraw Money
  function withdraw(amount: Decimal) {
    if (amount > 0 && amount <= this.balance) {
      this.balance -= amount
      print("Withdrew ${amount}. New Balance: ${this.balance}")
    } else if (amount > this.balance) {
      print("Insufficient balance.")
    } else {
      print("Invalid withdrawal amount.")
    }
  }

  // Method to Display Account Info
  function displayAccountInfo() {
    print("Account Number: ${this.accountNumber}")
    print("Account Holder: ${this.accountHolder}")
    print("Balance: ${this.balance}")
  }
}
