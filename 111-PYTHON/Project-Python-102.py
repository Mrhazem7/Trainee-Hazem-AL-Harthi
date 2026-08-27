from datetime import datetime

REFERENCE_DATE = datetime(2021, 1, 1)


def calculate_age_and_day(name, date_str):
    """يتحقق من صحة التاريخ، ويحسب العمر ويوم الميلاد (اسم اليوم)."""
    try:
        parts = date_str.split('-')
        if len(parts) != 3:
            print("Invalid date")
            return None
        day, month, year = parts
        day, month, year = int(day), int(month), int(year)
        birth_date = datetime(year, month, day)
    except (ValueError, TypeError):
        print("Invalid date")
        return None

    if birth_date > REFERENCE_DATE:
        print("Invalid date")
        return None

    age = REFERENCE_DATE.year - birth_date.year - (
        (REFERENCE_DATE.month, REFERENCE_DATE.day) < (birth_date.month, birth_date.day)
    )
    day_name = birth_date.strftime('%A')
    print(f"{name} is {age} years old and she/he was born on {day_name}")
    return {'name': name, 'date_str': date_str, 'date': birth_date, 'age': age, 'day_name': day_name}


def process_people(*people):
    """يعالج عدد غير محدود من الأشخاص (name, date) باستخدام *args."""
    if len(people) == 0:
        return []

    results = []
    for name, date_str in people:
        result = calculate_age_and_day(name, date_str)
        if result:
            results.append(result)

    if len(results) == 0:
        return results

    ages = [p['age'] for p in results]
    if ages.count(max(ages)) > 1 or ages.count(min(ages)) > 1:
        print("There is no oldest or youngest person")
    else:
        oldest = max(results, key=lambda p: p['age'])
        youngest = min(results, key=lambda p: p['age'])
        print(f"The oldest one is {oldest['name']}")
        print(f"The youngest one is {youngest['name']}")

    print(f"Total People: {len(results)}")
    return results


def print_sorted_oldest_to_youngest(results):
    """سؤال إضافي 1: ترتيب الأشخاص من الأكبر للأصغر."""
    print("\n-- Sorted from oldest to youngest --")
    sorted_people = sorted(results, key=lambda p: p['age'], reverse=True)
    for p in sorted_people:
        print(f"{p['name']} is {p['age']} years old and she/he was born on {p['day_name']}")


def print_reversed_inputs(people):
    """سؤال إضافي 2: طباعة نفس المدخلات لكن بشكل عكسي."""
    print("\n-- Reversed inputs --")
    for name, date_str in reversed(people):
        print(f"{name}, {date_str}")


def print_sunday_born(results):
    """سؤال إضافي 3: طباعة أسماء اللي ولدوا يوم الأحد فقط."""
    print("\n-- People born on Sunday --")
    sunday_people = [p['name'] for p in results if p['day_name'] == 'Sunday']
    if sunday_people:
        for name in sunday_people:
            print(name)
    else:
        print("No one was born on Sunday")


people = (
    ('Khalid', '1-2-1989'),
    ('Nouf', '2-9-2004'),
    ('Ali', '9-12-2009'),
)

results = process_people(*people)

if results:
    print_sorted_oldest_to_youngest(results)
    print_reversed_inputs(people)
    print_sunday_born(results)