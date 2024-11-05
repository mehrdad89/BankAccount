// Main.gsp - Main Application
uses bank.BankAccount

class Main {
  
  static function main(args: String[]) {
    // Create a new bank account
    var account = new BankAccount("123456789", "John Doe", 1000.00)

    // Display initial account info
    account.displayAccountInfo()

    // Deposit money
    account.deposit(500.00)
    
    // Withdraw money
    account.withdraw(200.00)

    // Try to withdraw more than the balance
    account.withdraw(2000.00)

    // Apply interest
    account.applyInterest(0.05, 6) // 5% interest for 6 months

    // Lock the account and try to perform transactions
    account.lockAccount()
    account.deposit(300.00)
    account.withdraw(100.00)

    // Unlock the account and perform transactions
    account.unlockAccount()
    account.deposit(300.00)
    account.withdraw(100.00)

    // Display final account info and transaction history
    account.displayAccountInfo()
    account.displayTransactionHistory()
  }
}
