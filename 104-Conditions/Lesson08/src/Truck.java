public class Truck extends Vehicle {
    private double cargoCapacity;

    public Truck(String ownerName, String brand, String model, int year, double cargoCapacity) {
        super(ownerName, brand, model, year);
        this.cargoCapacity = cargoCapacity;
    }

    public void setCargoCapacity(double cargoCapacity) {
        this.cargoCapacity = cargoCapacity;
    }

    public double getCargoCapacity() {
        return cargoCapacity;
    }

    @Override
    public void displayInfo() {
        System.out.println("owner: " + getownerName());
        System.out.println("Truck : " + getbrand() + " model : " + getModel() + " year : (" + getYear() + ")");
        System.out.println("Cargo Capacity: " + cargoCapacity + " tons");
    }
}