abstract class Product {
    abstract void price();
}

class Car extends Product {
    void price() {
        System.out.println("220k SAR");
    }
}

public class Abstraction {
    public static void main(String[] args) {
        Car myCar = new Car();
        myCar.price();
    }
}