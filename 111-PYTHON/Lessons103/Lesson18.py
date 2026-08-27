class Polygon:
    def p_display(self):
        print('This is Polygon class')


class Shape:
    def sh_display(self):
        print('This is Shape class')


class Square(Polygon, Shape):
    def s_display(self):
        print('This is Square class')


sq = Square()
sq.s_display()
sq.p_display()
sq.sh_display()