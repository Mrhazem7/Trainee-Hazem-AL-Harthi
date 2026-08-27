class Student:
    def __init__(self, name, age, id, grades):
        self.name = name
        self.age = age
        self.id = id
        self.grades = grades

    def talk(self):
        print('My name is: ', self.name)