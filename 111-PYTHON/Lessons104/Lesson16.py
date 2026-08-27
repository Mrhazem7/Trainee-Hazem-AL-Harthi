try:
    num = int(input("Enter a number: "))
    assert num % 2 == 0
except:
    print("Not an even number!")
else:
    evenNumber = num / 2
    print(evenNumber)