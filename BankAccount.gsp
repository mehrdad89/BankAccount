// BankAccount.gsp - Bank Account Class
package bank

uses java.util.Date

class BankAccount {
  
  // Properties
  var public accountNumber: String
  var public accountHolder: String
  var public balance: Decimal
  var public transactionHistory: List<String> = new ArrayList<String>()
  var public isLocked: Boolean = false

  // Constructor
  construct(accountNumber: String, accountHolder: String, initialDeposit: Decimal) {
    this.accountNumber = accountNumber
    this.accountHolder = accountHolder
    this.balance = initialDeposit
    transactionHistory.add("Account created with initial deposit of ${initialDeposit} on ${now()}")
  }

  // Method to Deposit Money
  function deposit(amount: Decimal) {
    if (isLocked) {
      print("Account is locked. Cannot deposit.")
      return
    }
    if (amount > 0) {
      this.balance += amount
      transactionHistory.add("Deposited ${amount} on ${now()}")
      print("Deposited ${amount}. New Balance: ${this.balance}")
    } else {
      print("Invalid deposit amount.")
    }
  }

  // Method to Withdraw Money
  function withdraw(amount: Decimal) {
    if (isLocked) {
      print("Account is locked. Cannot withdraw.")
      return
    }
    if (amount > 0 && amount <= this.balance) {
      this.balance -= amount
      transactionHistory.add("Withdrew ${amount} on ${now()}")
      print("Withdrew ${amount}. New Balance: ${this.balance}")
    } else if (amount > this.balance) {
      print("Insufficient balance.")
    } else {
      print("Invalid withdrawal amount.")
    }
  }

  // Method to Apply Interest
  function applyInterest(rate: Decimal, months: Integer) {
    if (rate > 0 && months > 0) {
      var interest = this.balance * rate * months / 12
      this.balance += interest
      transactionHistory.add("Applied ${rate * 100}% interest for ${months} months: +${interest} on ${now()}")
      print("Interest of ${interest} applied. New Balance: ${this.balance}")
    } else {
      print("Invalid interest rate or period.")
    }
  }

  // Methods to Lock and Unlock Account
  function lockAccount() {
    this.isLocked = true
    print("Account locked.")
  }

  function unlockAccount() {
    this.isLocked = false
    print("Account unlocked.")
  }

  // Method to Display Account Info
  function displayAccountInfo() {
    print("Account Number: ${this.accountNumber}")
    print("Account Holder: ${this.accountHolder}")
    print("Balance: ${this.balance}")
  }

  // Method to Display Transaction History
  function displayTransactionHistory() {
    print("Transaction History:")
    for (entry in transactionHistory) {
      print(entry)
    }
  }

  // Helper Method to Get Current Date
  private function now(): Date {
    return new Date()
  }
}
