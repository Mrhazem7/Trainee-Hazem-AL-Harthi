from datetime import datetime


class BankAccount:
    def __init__(self, owner):
        self.owner = owner
        self.__balance = 0

    def deposit(self, amount):
        if amount <= 0:
            print('Deposit amount must be greater than zero')
            return
        self.__balance += amount
        now = datetime.now()
        print(f"Deposited {amount} SAR to your bank balance on "
              f"{now.strftime('%A, %B %d %Y')}, at {now.strftime('%I:%M%p').lower()}.")

    def withdraw(self, amount):
        if amount <= 0:
            print('Withdrawal amount must be greater than zero')
            return
        if amount > self.__balance:
            print('Insufficient balance, withdrawal not allowed')
            return
        self.__balance -= amount
        now = datetime.now()
        print(f"Withdrew {amount} SAR from your bank balance on "
              f"{now.strftime('%A, %B %d %Y')}, at {now.strftime('%I:%M%p').lower()}.")

    def get_balance(self):
        print(f"Your current balance is: {self.__balance} SAR")
        return self.__balance


account1 = BankAccount('Hazem')

account1.get_balance()
account1.deposit(2000)
account1.withdraw(150)
account1.get_balance()