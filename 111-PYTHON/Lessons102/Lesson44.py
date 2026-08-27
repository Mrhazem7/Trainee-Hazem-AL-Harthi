def info(name, age):
    print('My name is', name, 'and I am', age, 'years old')


d = {'name': 'Hazem', 'age': 21}
info(**d)