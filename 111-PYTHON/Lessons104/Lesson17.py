age = int(input("Enter your age:"))

if age < 18:
    raise Exception("Sorry, This game for more than 18 age")

print("Start game")