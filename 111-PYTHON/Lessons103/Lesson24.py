class Circle:
    def draw(self):
        print('The code for drawing the circle')


class Square:
    def draw(self):
        print('The code for drawing the square')


class Triangle:
    def draw(self):
        print('The code for drawing the triangle')


circle1 = Circle()
square1 = Square()
triangle1 = Triangle()

shapes = [circle1, square1, triangle1]

for sh in shapes:
    sh.draw()