class Student:
    def __init__(self, name, age, id, grades):
        self.name = name
        self.age = age
        self.id = id
        self.grades = grades

    def talk(self):
        print('My name is: ', self.name)


std1 = Student('Hazem', 21, 'xx00', 95)
print(std1.name)
std1.talk()