class Employee:
    def __init__(self, name):
        self.name = name
        self._tel = '+96655xxxxxxx'
        self.__salary = 1700


emp1 = Employee('Hazem')

print(emp1.name)
print(emp1._tel)

emp1.__salary = 50
print(emp1.__salary)