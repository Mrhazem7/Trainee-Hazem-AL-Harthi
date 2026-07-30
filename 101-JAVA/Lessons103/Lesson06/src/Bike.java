public class Bike extends Vehicle {
    private int wheels;

    public Bike(String brnd,int year, int wheels){
        super(brand, year);
        this.wheels=wheels;

    }

    public void ride(){
        System.out.println("Bike is riding !");

    }
}
