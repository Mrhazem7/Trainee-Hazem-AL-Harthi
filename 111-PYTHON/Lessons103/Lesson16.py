class Animal:
    def __init__(self, name, color): ...

    def run(speed): ...

    def make_sound(self):
        print('sound...')


class Cat(Animal):
    def make_sound(self):
        print('mew...')


cat1 = Cat('Lili', 'Brown')
cat1.make_sound()