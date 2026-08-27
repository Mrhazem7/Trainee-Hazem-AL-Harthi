class Student:
    def __init__(self, name, age, id, grades):
        self.name = name
        self.age = age
        self.id = id
        self.grades = grades

    def talk(self):
        print('My name is: ', self.name)


std1 = Student('Hazem', 21, 'xx00', [95, 98, 99])
std2 = Student('Hessah', 19, 'xx01', 86)

std2.v_hours = 16

print(dir(std1))
print(dir(std2))