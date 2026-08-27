class MyClass:
    def set_val(self, value):
        self.value = value

    def get_val(self):
        return self.value


a = MyClass()
b = MyClass()

a.set_val(10)
a.value = 'hello'
b.set_val(100)

print(a.get_val())
print(a.value)
print(b.get_val())