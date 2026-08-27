class Bike:
    def __init__(self, description, cost, sale_price, condition):
        self.description = description
        self.cost = cost
        self.sale_price = sale_price
        self.condition = condition
        self.sold = False

    def update_sale_price(self, sale_price):
        if self.sold == True:
            print('Action not allowed, Bike has already been sold')
        else:
            self.sale_price = sale_price

    def sell(self):
        self.sold = True


bike1 = Bike('Univega Alpina, orange', cost=100, sale_price=500, condition=0.5)
bike1.update_sale_price(350)
bike1.sell()