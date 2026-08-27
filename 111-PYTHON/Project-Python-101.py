phone_directory = {
    '1111111111': 'Hazem',
    '2222222222': 'Majed',
    '3333333333': 'Fahad',
    '4444444444': 'Faisal',
    '5555555555': 'Dalal',
    '6666666666': 'Hatan',
    '7777777777': 'Layla'
}


def search_by_number(number):
    if not number.isdigit() or len(number) != 10:
        print("This is invalid number")
    elif number in phone_directory:
        print(phone_directory[number])
    else:
        print("Sorry, the number is not found")


# اختبارات (Tests):
search_by_number('1111111111')   # Hazem
search_by_number('9999999999')   # Sorry, the number is not found
search_by_number('12345')        # This is invalid number