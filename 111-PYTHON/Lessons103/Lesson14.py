class Employee:
    def __init__(self, name):
        self.name = name
        self._tel = '+96655xxxxxxx'
        self.__salary = 1700

    def _job_title(self):
        print('Programmer')

    def __give_raise(self):
        self.__salary = self.__salary + 500
        print('Your Salary now is: ', self.__salary)


emp1 = Employee('Hazem')

emp1._job_title()
emp1.__give_raise()