class Vehicle:
    def __init__(self, company, owner, color, current_speed):
        self.company = company
        self.owner = owner
        self.color = color
        self.current_speed = current_speed

    def move(self):
        print('The car has moved')

    def stop(self):
        print('The car has stopped')


class Car(Vehicle):
    def display(self):
        print('This is the Car class')


class Truck(Vehicle):
    def display(self):
        print('This is the Truck Class')


car1 = Car('Jeep', 'Hazem', 'Black', 0)
truck1 = Truck('Mercedes', 'Mohammed', 'White', 0)

print(truck1.company)
truck1.move()
print(car1.company)
car1.move()