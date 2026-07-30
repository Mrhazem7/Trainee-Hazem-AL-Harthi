import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Garage garage =new Garage();
        Scanner scanner = new Scanner(System.in);

        int choice = 0;

        do{

            System.out.println("Menu:");
            System.out.println("1. Add a vehicle");
            System.out.println("2. Update a vehicle");
            System.out.println("3. Remove a vehicle");
            System.out.println("4. Display vehicles");
            System.out.println("5. Display details of a vehicle");
            System.out.println("0. Exit");

            System.out.print("Enter your choice: ");
            choice= scanner.nextInt();

            switch(choice){
                case 1:
                    System.out.println("Choose the vehicle type :");
                    System.out.println("1. Car");
                    System.out.println("2. Motorcycle");
                    System.out.println("3. Truck");

                    System.out.println("Enter the vehicle (1-3) : ");
                    int vehicleTypeChoice = scanner.nextInt();
                    switch(vehicleTypeChoice){
                        case 1:
                            System.out.println("Enter owner name :");
                            String carOwner = scanner.nextLine();
                            System.out.println("Enter vehicle brand :");
                            String carBrand = scanner.nextLine();
                            System.out.println("Enter vehicle model :");
                            String carModel = scanner.nextLine();
                            System.out.println("Enter vehicle year :");
                            int carYear = scanner.nextInt();
                            scanner.nextLine();
                            System.out.println("Enter seating capacity : ");
                            int seatingCapacity =scanner.nextInt();
                            garage.addVehicle(new Car(carOwner, carBrand, carModel, carYear, seatingCapacity));
                            break;

                        case 2:
                            System.out.println("Enter owner name :");
                            String motorcycleOwner = scanner.nextLine();
                            System.out.println("Enter vehicle brand :");
                            String motorcyclebrand = scanner.nextLine();
                            System.out.println("Enter vehicle model :");
                            String motorcyclemodel = scanner.nextLine();
                            System.out.println("Enter vehicle year :");
                            int motorcycleyear = scanner.nextInt();
                            scanner.nextLine();
                            System.out.println("Enter engine size : ");
                            int engineSize =scanner.nextInt();
                            garage.addVehicle(new Motorcycle(motorcycleOwner,motorcyclebrand,motorcyclemodel,motorcycleyear,engineSize));
                            break;

                        case 3:
                            System.out.println("Enter owner name :");
                            String truckOwner = scanner.nextLine();
                            System.out.println("Enter vehicle brand :");
                            String truckbrand = scanner.nextLine();
                            System.out.println("Enter vehicle model :");
                            String truckmodel = scanner.nextLine();
                            System.out.println("Enter vehicle year :");
                            int truckyear = scanner.nextInt();
                            scanner.nextLine();
                            System.out.println("Enter cargo capacity (tons) : ");
                            int cargoCapacity =scanner.nextInt();
                            garage.addVehicle(new Truck(truckOwner, truckbrand, truckmodel, truckyear,cargoCapacity));
                            break;

                        default:
                            System.out.println("Invalid vehicle type choice. ");
                            break;
                    }
                    break;

                case 2:

                    System.out.println("Enter owner name of the vehicle to update: ");

                    String updateOwner = scanner.nextLine();

                    System.out.println("Enter new owner name: ");

                    String owner = scanner.nextLine();

                    System.out.println("Enter new vehicle brand: ");

                    String brand = scanner.nextLine();

                    System.out.println("Enter new vehicle model: ");

                    String model = scanner.nextLine();

                    System.out.println("Enter new vehicle year: ");

                    int year = scanner.nextInt();

                    garage.updateVehicle(brand, model, year, owner, updateOwner);
                    break;
            }

        } while(choice != 0);
    }
}