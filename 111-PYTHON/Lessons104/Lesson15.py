# 0 1 2
myList = [1, 2, 0]

try:
    print("the result = ", myList[1] / myList[2])

except ZeroDivisionError:
    print("ZeroDivisionError!!")

except IndexError:
    print("IndexError!!")