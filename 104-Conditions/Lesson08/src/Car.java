public class Car extends Vehicle {
    private int seatingCapacity;

    public Car(String ownerName, String brand, String model, int year, int seatingCapacity) {
        super(ownerName, brand, model, year);
        this.seatingCapacity = seatingCapacity;
    }

    public void setSeatingCapacity(int seatingCapacity) {
        this.seatingCapacity = seatingCapacity;
    }

    public int getSeatingCapacity() {
        return seatingCapacity;
    }

    @Override
    public void displayInfo() {
        System.out.println("owner: " + getownerName());
        System.out.println("Car : " + getbrand() + " model : " + getModel() + " year : (" + getYear() + ")");
        System.out.println("Seating Capacity: " + seatingCapacity);
    }
}