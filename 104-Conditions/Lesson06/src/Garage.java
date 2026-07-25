public class Garage {
    private Vehicle[] vehicles;
    private int count;

    public Garage(){
        this.vehicles = new Vehicle[100];
        this.count = 0;
    }

    public void addVehicle(Vehicle vehicle){
        if(count < vehicles.length){
            vehicles[count] = vehicle;
            count++;
            System.out.println("Vehicle added to the garage . ");
        } else{
            System.out.println("Garage is full. can not add more vehicles .");
        }
    }
}