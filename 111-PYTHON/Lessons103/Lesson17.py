class Grandparent:
    def g_display(self):
        print('This is Grandparent class')


class Parent(Grandparent):
    def p_display(self):
        print('This is Parent class')


class Child(Parent):
    def c_display(self):
        print('This is Child class')


child1 = Child()
child1.c_display()
child1.p_display()
child1.g_display()