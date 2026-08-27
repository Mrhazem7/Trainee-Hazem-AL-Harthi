class MyInteger:
    def set_val(self, val):
        if type(val) == int:
            self.val = val
        else:
            print('The value is not an integer')

    def get_val(self):
        return self.val

    def increment_val(self):
        self.val += 1


i = MyInteger()

i.val = 'hello'
i.increment_val()