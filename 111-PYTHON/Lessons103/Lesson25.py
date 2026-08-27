class Student:
    def print_info(self):
        print('This is the code for class Student')


class Teacher:
    def print_info(self):
        print('This is the code for class Teacher')


student1 = Student()
teacher1 = Teacher()


def func(obj):
    obj.print_info()


func(student1)
func(teacher1)