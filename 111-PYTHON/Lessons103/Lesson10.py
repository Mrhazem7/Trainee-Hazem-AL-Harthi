class Student:
    university_name = 'King Saud University'

    def __init__(self, name, age, id, grades):
        self.name = name
        self.age = age
        self.id = id
        self.grades = grades


std1 = Student('Hazem', 21, 'xx00', [95, 98, 99])
std2 = Student('Hessah', 19, 'xx01', 86)

print(std1.university_name)
print(std2.university_name)