ages = [30, 9, 15, 22, 17, 44, 26, 5]


def filtered_ages(age):
    return age >= 18


print(list(filter(filtered_ages, ages)))