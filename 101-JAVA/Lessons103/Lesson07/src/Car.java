public class Car extends Vehicle {
    private int fuelType;

    public Car(String brand,int year, int fuelType){
        super(brand, year);
        this.fuelType=fuelType;

    }

    public void drive(){
        System.out.println("Car is driving !");
    }
}
