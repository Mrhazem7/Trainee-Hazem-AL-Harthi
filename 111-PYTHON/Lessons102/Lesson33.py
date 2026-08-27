numbers = [5, 10, 20, 25, 50]
sq_numbers = []


def square(numbers):
    for num in numbers:
        sq_numbers.append(num**2)

    return sq_numbers


print(square(numbers))